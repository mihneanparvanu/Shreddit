//
//  HealthManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 03.07.2025.
//

import HealthKit

struct HealthManager {
	
	let healthStore = HKHealthStore()
	
	func requestAuthorization() async throws {
		let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)!
		let activeEnergy = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
		let basalEnergy = HKQuantityType.quantityType(forIdentifier: .basalEnergyBurned)!
		
		let allTypes: Set<HKSampleType> = [
			stepCount,
			activeEnergy,
			basalEnergy
		]
		
		do {
			if HKHealthStore.isHealthDataAvailable() {
				try await healthStore.requestAuthorization(toShare: allTypes, read: allTypes)
			}
		}
		catch {
			fatalError(error.localizedDescription)
		}
	}
	
	
	func fetchCumulativeSum(for type: HKQuantityType, unit: HKUnit, startDate: Date) async throws -> Int {
		let endDate = Date()
		
		let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
		
		return try await withCheckedThrowingContinuation { continuation in
			let query = HKStatisticsQuery(
				quantityType: type,
				quantitySamplePredicate: predicate,
				options: .cumulativeSum) {_, results, error in
					
					if let error = error {
						continuation.resume(throwing: error)
						return
					}
					
					guard let results = results, let sum = results.sumQuantity() else {
						continuation.resume(returning: 0)
						return
					}
					
					let intSum = Int(sum.doubleValue(for: unit))
					continuation.resume(returning: intSum)
				}
		}
	}
	
	func fetchSteps (startDate: Date) async throws -> Int {
		let stepCountType = HKQuantityType(.stepCount)
		
		
		return try await fetchCumulativeSum(
			for: stepCountType,
			unit: .count(),
			startDate: startDate
		)
	}
	
	func fetchEnergyBurned (startDate: Date) async throws -> (basal: Int, active: Int) {
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
		
		return try await (basal, active)
	}
	
}




