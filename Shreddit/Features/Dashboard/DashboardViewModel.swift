//
//  DashboardViewViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import HealthKit
import Observation
import SwiftUI

@MainActor
@Observable
final class DashboardViewModel {
	//MARK: Properties
	
	// Dependencies
	let healthManager: HealthManager

	// Content
	var presentedContent: DashboardView.ContentType?
	
	var sheetContent: DashboardView.ContentType? {
		get {
			guard let presentedContent, presentedContent.presentation == .sheet else {
				return nil
			}
			return presentedContent
		}
		set {
			if newValue == nil {
				presentedContent = nil
			}
		}
	}
	
	var fullScreenContent: DashboardView.ContentType? {
		get {
			guard let presentedContent, presentedContent.presentation == .fullScreen else {
				return nil
			}
			return presentedContent
		}
		set {
			if newValue == nil {
				presentedContent = nil
			}
		}
	}
	
	// Health data
	
	let startDate = Date().startOfDay
	
	var steps = 0
	
	var totalEnergyBurned = 0
	
	//Error alert
	
	var alert: AlertItem?
	
	//MARK: Initializer
	
	init (healthManager: HealthManager){
		self.healthManager = healthManager
	}
	
	//MARK: Methods
	
	func setupAndFetch () async {
		do {
			//1. Set up HealthKit
			try await healthManager.requestAuthorization()
			
			//2. Fetch the data
			 try await withThrowingTaskGroup{ group in
				group.addTask {
					try await self.fetchSteps()
				}
				group.addTask {
					try await self.fetchTotalEnergyBurned()
				}
				 for try await _ in group {}
			}
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
	
	private func fetchTotalEnergyBurned() async throws {
			let (basal, active) = try await healthManager.fetchEnergyBurned(startDate: startDate)
			totalEnergyBurned = basal + active
	}
	
	private func fetchSteps () async throws {
			steps = try await healthManager.fetchSteps(startDate: startDate)
	}
}

