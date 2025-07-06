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
	
	func fetchData() async {
		async let stepsTask: () = fetchSteps()
		async let totalEnergyBurnedTask:() = fetchTotalEnergyBurned()
		
		_ = await (stepsTask, totalEnergyBurnedTask)
	}
	
	private func fetchTotalEnergyBurned() async  {
		do {
			let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
			totalEnergyBurned = basal + active
		}
		catch {
			totalEnergyBurned = 0
		}
	}
	
	private func fetchSteps () async  {
		do {
			steps = try await healthManager.fetchSteps(startDate: startDate)
		}
		catch {
			steps = 0
		}
		
	}
	
	func requestAuthorization () async  {
		try? await healthManager.requestAuthorization()
	}
}
