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
	let settingsManager: any SettingsManager
	private let converter = UnitConverter()
	
	//MARK: Properties
	
	var startDate = Date().startOfDay
	var deficit = 600
	
	// Calories in
	var dietaryEnergyConsumed = 0
	var dietaryProtein = Macro(title: "Protein",
							   currentValue: 0,
							   goal: 200,
							   unit: "g")
	var caloriesLeft: Int {
		(tdee - dietaryEnergyConsumed) - deficit
	}
	
	// Body stats
	var currentWeight: Double = 143
	var goalWeight: Double = 138
	
	var weightToLose: Double {
		currentWeight - goalWeight
	}
	
	var caloriesLeftInDeficit: Int {
		let massUnit = settingsManager.settings.units.massUnit
		return converter.calories(forWeight: weightToLose, in: massUnit)
	}
	
	// Calories out
	var steps = 0
	var tdee = 0
	
	// Alert
	var alert: AlertItem?
	
	//MARK: Initializer
	init (healthManager: HealthManager,
		  settingsManager: any SettingsManager
	) {
		self.healthManager = healthManager
		self.settingsManager = settingsManager
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
	
	
	 func fetchEverything () async throws {
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
			group.addTask {
				try await self.fetchMacros()
			}
			for try await _ in group {}
		}

	}

	private func fetchMacros() async throws {
		dietaryProtein.currentValue = try await healthManager
			.fetchMacros(startDate: startDate).protein
	}
	
	private func fetchTotalEnergyBurned() async throws {
		let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
		tdee = basal + active
	}
	
	private func fetchSteps () async throws {
		steps = try await healthManager.fetchSteps(startDate: startDate)
	}
	
	private func fetchDietaryEnergyConsumed() async throws {
		dietaryEnergyConsumed = try await healthManager.fetchDietaryEnergyConsumed(startDate: startDate)
	}
	
}

extension DietStatsViewModel {
	struct Macro {
		let title: String
		var currentValue: Int
		var goal: Int
		let unit: String
	}
}
