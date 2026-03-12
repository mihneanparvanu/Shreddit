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
	let deficit: Int?

	let startDate = Date().startOfDay

	var dietaryEnergyConsumed: Int = 0
	
	var protein = MacroData(macro: .protein, currentValue: 0, goal: 150)
	var carbs = MacroData(macro: .carbs, currentValue: 0, goal: 200)
	var fat = MacroData(macro: .fat, currentValue: 0, goal: 60)

	var caloriesLeft: Int = 0

	// MARK: Initializer

	init(healthManager: HealthManager, deficit: Int?) {
		self.healthManager = healthManager
		self.deficit = deficit
	}

	func fetchCaloriesLeft() async throws {
		let tdee = try await fetchTDEE()

		caloriesLeft = tdee - dietaryEnergyConsumed - (deficit ?? 0)
	}
	

	func fetchDietaryStats() async throws {
		dietaryEnergyConsumed = try await fetchDietaryCalories()

		let macros = try await fetchMacros()
		protein.currentValue = macros.protein
		carbs.currentValue = macros.carbs
		fat.currentValue = macros.fat
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
