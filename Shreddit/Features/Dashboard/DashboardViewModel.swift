//
//  DashboardViewViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import Observation
import SwiftUI

@MainActor
@Observable
final class DashboardViewModel {
	let healthManager: HealthManager
	let startDate = Date().startOfDay
	
	init (healthManager: HealthManager){
		self.healthManager = healthManager
	}
	
	var steps = 0
	var totalEnergyBurned = 0
	
	
	func fetchSteps () async throws {
		steps = try await healthManager.fetchSteps(startDate: startDate)
	}
	
	func fetchTotalEnergyBurned() async throws {
		let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
		totalEnergyBurned = basal + active
	}
}
