//
//  HealthManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 03.07.2025.
//

import HealthKit

struct HealthManager {
	//MARK: Properties
	
	let healthStore = HKHealthStore()
	
	//Activity
	let stepCount = HKQuantityType(.stepCount)
	let activeEnergy = HKQuantityType(.activeEnergyBurned)
	
	//Body stats
	let basalEnergy = HKQuantityType(.basalEnergyBurned)
	let currentWeight = HKQuantityType(.bodyMass)
	
	var allTypes: Set<HKSampleType> {
		[
			stepCount,
			basalEnergy,
			activeEnergy,
			currentWeight
		]
	}
	
	//MARK: Methods
	
	func requestAuthorization() async throws {
		//1. Check for HealthKit availability on device
		guard HKHealthStore.isHealthDataAvailable() else {
			throw HealthKitError.notAvailableOnDevice
		}
		
		//2. Request authorization
		try await healthStore.requestAuthorization(toShare: allTypes, read: allTypes)
	}
	
	func userHasAuthorizedDataAccess() -> Bool  {
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
				options: .cumulativeSum) {_, results, error in
					
					if let error = error  {
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

