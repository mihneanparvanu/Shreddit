//
//  DashboardViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import Observation
import SwiftUI

@MainActor
@Observable
final class DashboardViewModel {
    // MARK: Properties
	
	// MARK: Dependencies & Properties

	let healthManager: HealthManager

	let startDate = Date().startOfDay

	// MARK: Initializer

	init(healthManager: HealthManager) {
		self.healthManager = healthManager
	}

	func fetchCaloriesLeft() async throws {
		let tdee = try await fetchTDEE()
	}
	

	func fetchDietaryStats() async throws {
		let dietaryEnergyConsumed = try await fetchDietaryCalories()

		let macros = try await fetchMacros()
	}

	private func fetchTDEE() async throws -> Int {
		return try await healthManager.fetchEnergyBurned(startDate: startDate).tdee
	}

	private func fetchDietaryCalories() async throws -> Int {
		return try await healthManager.fetchDietaryEnergyConsumed(startDate: startDate)
	}

	private func fetchMacros() async throws -> (protein: Int, carbs: Int, fat: Int) {
		let macros = try await healthManager.fetchMacros(startDate: startDate)
		return (macros.protein, macros.carbs, macros.fat)
	}

    private var presentedContent: DashboardView.ContentType?

    var sheetContent: DashboardView.ContentType? {
        get {
            guard let presentedContent, presentedContent.presentation == .sheet else {
                return nil
            }
            return presentedContent
        }
        set {
            presentedContent = newValue
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
            presentedContent = newValue
        }
    }

    var popupContent: DashboardView.ContentType? {
        get {
            guard let presentedContent, presentedContent.presentation == .popup else {
                return nil
            }
            return presentedContent
        }
        set {
            presentedContent = newValue
        }
    }

    // MARK: Methods

    func present(_ content: DashboardView.ContentType) {
        presentedContent = content
    }
}
