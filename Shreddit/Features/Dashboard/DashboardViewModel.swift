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
	
	var alert: AlertItem?
	
	
	func setupAndFetch () async {
		do {
			//1. Set up HealthKit
			try await healthManager.requestAuthorization()
			
			//2. Fetch the data
			async let fetchSteps: () = fetchSteps()
			async let fetchEnergyBurned: () = fetchTotalEnergyBurned()
			_ = try await (fetchSteps, fetchEnergyBurned)
		}

		catch let error as HealthKitError {
			switch error {
				case .notAvailableOnDevice:
					alert = .init(title: "Error", message: "HealthKit is not available on this device.")
				case .authorizationDenied:
					alert = .init(title: "Error", message: "HealthKit authorization is denied.")
				case .dataUnavailable:
					alert = .init(title: "Error", message: "No data available for the specified date range.")
			}
		}
		catch {
			alert = .init(title: "Error", message: error.localizedDescription)
		}
		
	}
	
	private func fetchTotalEnergyBurned() async throws {
		do {
			let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
			totalEnergyBurned = basal + active
		}
		catch {
			totalEnergyBurned = 0
		}
	}
	
	private func fetchSteps () async throws {
		do {
			steps = try await healthManager.fetchSteps(startDate: startDate)
		}
		catch {
			steps = 0
		}
		
	}
	
	
}


struct AlertItem: Identifiable {
	let id = UUID()
	let title: String
	let message: String
	let dismiss: Alert.Button = .default(Text("OK"))
}
