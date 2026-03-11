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
final class DietViewModel {
    // MARK: Dependencies

    let healthManager: HealthManager
    let settingsManager: any SettingsManager
	
	var startDate = Date().startOfDay
	
	var diet: Diet?
	
    var currentDeficit: Int {
        if let diet = diet {
            return PhysiologyEngine
                .calculateDailyDeficit(
                    weight: diet.currentWeight,
					unit: settingsManager.settings.units.foundationMass,
                    weeklyLossRate: diet.difficulty.weeklyLossRatePercentage
                )
        }
		return 0
    }
	
	var remainingDeficit: Int {
		if let diet = diet {
			return PhysiologyEngine
				.calculateDeficitRemainingInDiet(
					weight: diet.currentWeight,
					goalWeight: diet.goalWeight,
					unit: settingsManager.settings.units.foundationMass
				)
		}
		return 0
	}
	
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
