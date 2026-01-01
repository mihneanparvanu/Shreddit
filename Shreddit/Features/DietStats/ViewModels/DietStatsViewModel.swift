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
	
	
	var startDate = Date().startOfDay
	var deficit = 600
	
	// Calories in
	var dietaryEnergyConsumed = 0
	var protein = Macro(title: "Protein",
							   currentValue: 0,
							   goal: 200)
	
	var carbs = Macro(title: "Carbs",
							 currentValue: 0,
							 goal: 300)
	
	var fat = Macro(title: "Fat",
							 currentValue: 0,
							 goal: 45)
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
}
