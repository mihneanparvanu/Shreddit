//
//  ActivitySummaryViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import HealthKit
import Observation
import SwiftUI

@Observable
@MainActor
final class DietStatsViewModel {
	//MARK: Dependencies
	let healthManager: HealthManager
	
	//MARK: Properties
	
	var startDate = Date().startOfDay
	var deficit = 600
	
	// Calories in
	var dietaryEnergyConsumed = 0
	var caloriesLeft: Int {
		(tdee - dietaryEnergyConsumed) - deficit
	}
	
	// Calories out
	var steps = 0
	var tdee = 0
	
	// Alert
	var alert: AlertItem?
	
	//MARK: Initializer
	init (healthManager: HealthManager) {
		self.healthManager = healthManager
	}
	
	//MARK: Methods
	
	func setupAndFetch () async {
		do {
			//1. Set up HealthKit
			try await healthManager.requestAuthorization()
			
			//2. Fetch the data
			try await fetchEverything()
		}
		
		catch let error as HKError  {
			switch error.code {
				case .errorRequiredAuthorizationDenied, .errorAuthorizationDenied, .errorNoData:
					alert = AlertItem(title: "Error", message: "Authorization denied to access data.")
				default:
					alert = AlertItem(
						title: "Error",
						message: error.localizedDescription
					)
			}
		}
		
		catch let error as HealthKitError {
			switch error {
				case .notAvailableOnDevice:
					alert = AlertItem(title: "Error",
									  message: "HealthKit is not available on this device."
					)
				case .dataUnavailable:
					alert = AlertItem(title: "Error",
									  message: "No data available for the specified date range."
					)
			}
		}
		catch {
			alert = AlertItem(
				title: "Error",
				message: error.localizedDescription
			)
		}
		
	}
	
	
	private func fetchEverything () async throws {
		try await withThrowingTaskGroup{ group in
			group.addTask {
				try await self.fetchSteps()
			}
			group.addTask {
				try await self.fetchTotalEnergyBurned()
			}
			group.addTask {
				try await self.fetchDietaryEnergyConsumed()
			}
			for try await _ in group {}
		}

	}
	
	private func fetchTotalEnergyBurned() async throws {
		let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
		tdee = basal + active
	}
	
	private func fetchSteps () async throws {
		steps = try await healthManager.fetchSteps(startDate: startDate)
	}
	
	func fetchDietaryEnergyConsumed() async throws {
		dietaryEnergyConsumed = try await healthManager.fetchDietaryEnergyConsumed(startDate: startDate)
	}
	
}
