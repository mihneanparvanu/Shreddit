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
final class DashboardViewViewModel {
	let healthManager = HealthManager()
	let startDate = Date().startOfDay
	
	var steps = 0
	var totalEnergyBurnded = 0
	
	
	func fetchSteps () async throws {
		steps = try await healthManager.fetchSteps(startDate: startDate)
	}
	
	func fetchTotalEnergyBurned() async throws {
		let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
		totalEnergyBurnded = basal + active
	}
}
