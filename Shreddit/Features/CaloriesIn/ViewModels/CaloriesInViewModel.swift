//
//  CaloriesInViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/21/25.
//

import Observation
import SwiftUI

@Observable
final class CaloriesInViewModel {
    // MARK: Dependencies & Properties

    let healthManager: HealthManager
    let deficit: Int?

    let startDate = Date().startOfDay

    var dietaryEnergyConsumed: Int = 0
    var protein = Macro(title: "Protein",
                        currentValue: 0,
                        goal: 0)
    var carbs = Macro(title: "Carbs",
                      currentValue: 0,
                      goal: 0)
    var fat = Macro(title: "Fat",
                    currentValue: 0,
                    goal: 0)

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
}
