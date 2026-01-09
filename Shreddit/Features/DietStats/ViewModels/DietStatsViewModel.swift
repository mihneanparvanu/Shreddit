//
//  DietStatsViewModel.swift
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
    // MARK: Dependencies

    var diet: Diet?
    let healthManager: HealthManager
    let settingsManager: any SettingsManager

    var startDate = Date().startOfDay
    var deficit = 600

    var currentDeficit: Int {
        if let diet = diet {
            return PhysiologyEngine
                .calculateDailyDeficit(
                    weight: diet.currentWeight,
                    unit: settingsManager.settings.units.unitMass,
                    weeklyLossRate: diet.difficulty.weeklyLossRatePercentage
                )
        }
        return deficit
    }

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

    // Calories out
    var steps = 0
    var tdee = 0

    // Alert
    var alert: AlertItem?

    // MARK: Initializer

    init(diet: Diet?,
         healthManager: HealthManager,
         settingsManager: any SettingsManager)
    {
        self.diet = diet
        self.healthManager = healthManager
        self.settingsManager = settingsManager
    }

    // MARK: Methods
}
