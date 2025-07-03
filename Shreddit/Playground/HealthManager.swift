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
}




