//
//  HealthManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 03.07.2025.
//

import HealthKit
import Observation

@Observable
final class HealthManager {
    // MARK: Properties

    let healthStore = HKHealthStore()

    // Activity
    let stepCount = HKQuantityType(.stepCount)
    let activeEnergy = HKQuantityType(.activeEnergyBurned)

    // Diet stats
    let dietaryEnergyConsumed = HKQuantityType(.dietaryEnergyConsumed)
    let dietaryProtein = HKQuantityType(.dietaryProtein)
    let dietaryFat = HKQuantityType(.dietaryFatTotal)
    let dietaryCarbs = HKQuantityType(.dietaryCarbohydrates)

    // Body stats
    let basalEnergy = HKQuantityType(.basalEnergyBurned)
    let currentWeight = HKQuantityType(.bodyMass)

    var allTypes: Set<HKSampleType> {
        [
            stepCount,
            basalEnergy,
            activeEnergy,
            currentWeight,
            dietaryEnergyConsumed,
            dietaryProtein,
            dietaryFat,
            dietaryCarbs,
        ]
    }
	

    // MARK: Methods

    func requestAuthorization() async throws {
        // 1. Check for HealthKit availability on device
        guard HKHealthStore.isHealthDataAvailable() else {
            throw HealthKitError.notAvailableOnDevice
        }

        // 2. Request authorization
        try await healthStore.requestAuthorization(toShare: allTypes, read: allTypes)
    }

    func userHasAuthorizedDataAccess() -> Bool {
        return allTypes.allSatisfy { type in
            healthStore.authorizationStatus(for: type) == .sharingAuthorized
        }
    }

    func fetchCumulativeSum(for type: HKQuantityType, unit: HKUnit, startDate: Date) async throws -> Int {
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)

        return try await withCheckedThrowingContinuation { continuation in
            let query = HKStatisticsQuery(
                quantityType: type,
                quantitySamplePredicate: predicate,
                options: .cumulativeSum
            ) { _, results, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let results = results else {
                    continuation.resume(throwing: HealthKitError.dataUnavailable)
                    return
                }

                let sum = results.sumQuantity()
                let intSum = Int(sum?.doubleValue(for: unit) ?? 0)
                continuation.resume(returning: intSum)
            }
            healthStore.execute(query)
        }
    }

    func fetchMacros(startDate: Date) async throws -> (protein: Int, fat: Int, carbs: Int) {
        async let protein = fetchCumulativeSum(
            for: dietaryProtein,
            unit: .gram(),
            startDate: startDate
        )

        async let fat = fetchCumulativeSum(
            for: dietaryFat,
            unit: .gram(),
            startDate: startDate
        )

        async let carbs = fetchCumulativeSum(
            for: dietaryCarbs,
            unit: .gram(),
            startDate: startDate
        )

        return try await (protein, fat, carbs)
    }

    func fetchDietaryEnergyConsumed(startDate: Date) async throws -> Int {
        return try await fetchCumulativeSum(
            for: dietaryEnergyConsumed,
            unit: .kilocalorie(),
            startDate: startDate
        )
    }

    func fetchSteps(startDate: Date) async throws -> Int {
        let stepCountType = HKQuantityType(.stepCount)

        return try await fetchCumulativeSum(
            for: stepCountType,
            unit: .count(),
            startDate: startDate
        )
    }

    func fetchEnergyBurned(startDate: Date) async throws -> (basal: Int, active: Int, tdee: Int) {
        let basalEnergyType = HKQuantityType(.basalEnergyBurned)
        let activeEnergyType = HKQuantityType(.activeEnergyBurned)

        async let basal = fetchCumulativeSum(
            for: basalEnergyType,
            unit: .kilocalorie(),
            startDate: startDate
        )
        async let active = fetchCumulativeSum(
            for: activeEnergyType,
            unit: .kilocalorie(),
            startDate: startDate
        )

        return try await (basal, active, basal + active)
    }
}

extension HealthManager {
	func fetchAverageWeight (days: Int = 14) async throws -> Double {
		guard let weightType = HKQuantityType.quantityType(
			forIdentifier: .bodyMass
		) else {
			throw HealthKitError.dataUnavailable
		}
		
		let endDate = Date()
		guard let startDate = Calendar.current.date(
			byAdding: .day,
			value: -days,
			to: endDate
		) else {
			throw HealthKitError.dataUnavailable
		}
		
		let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
		
		return try await withCheckedThrowingContinuation { continuation in
					
					let query = HKStatisticsQuery(
						quantityType: weightType,
						quantitySamplePredicate: predicate,
						options: .discreteAverage
					) { _, result, error in
						
						if let error = error {
							continuation.resume(throwing: error)
							return
						}
						
						guard let averageQuantity = result?.averageQuantity() else {
							continuation.resume(returning: 0.0)
							return
						}
						
						let averageKg = averageQuantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
						continuation.resume(returning: averageKg)
					}
					
					self.healthStore.execute(query)
				}
	}
}
