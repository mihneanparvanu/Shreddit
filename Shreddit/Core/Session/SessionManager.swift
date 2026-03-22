//
//  SessionManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/21/26.
//

import SwiftUI
import Observation

@Observable
@MainActor final class SessionManager {
	
	var user: User
	
	init(user: User = .preview) {
		self.user = user
	}
	
	func performDailyDietUpdateIfNeeded (healthManager: HealthManager) async throws {
		
		// Get yesterday's date
		guard let yesterday = Calendar.current.date(
			byAdding: .day,
			value: -1,
			to: .now
		) else {
			return
		}
		
		// Get user diet
		guard let diet = user.currentDiet else {
			return
		}
		
		// Fetch the data
		let healthTDEE = try await healthManager.fetchEnergyBurned(
			startDate: yesterday
		).tdee
		let intake = try await healthManager.fetchDietaryEnergyConsumed(
			startDate: yesterday
		)
		
		// Run the math
		let newData: PhysiologyEngine.CompensationResult = PhysiologyEngine.compensateForDay(
			yesterdayPenalty: diet.tdeePenalty,
			healthTDEE: healthTDEE,
			energyIntake: intake,
			oldLedger: diet.activeLedger,
			weight: diet.currentAvgWeight,
			goalWeight: diet.goalWeight,
		)
		
		// Update the diet
		user.currentDiet?.tdeePenalty = newData.newPenalty
		user.currentDiet?.activeLedger = newData.activeLedger
	}
}
