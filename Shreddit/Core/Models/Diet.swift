//
//  Diet.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import Foundation

struct Diet: Identifiable, Codable {
	var id: String { "Diet \(startDate) - \(endDate)" }
	let startDate: Date
	let endDate: Date
	let startWeight: Double
	let currentAvgWeight: Double
	let goalWeight: Double
	var daysElapsed: Int {
		Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
	}
	let difficulty: Difficulty
	
	var dailyDeficit: Int {
		PhysiologyEngine
			.calculateDailyDeficit(
				weight: currentAvgWeight,
				weeklyLossMultiplier: difficulty
					.weeklyLossRateMultiplier)
	}

	//MARK: Remaining deficit feature

	var startingRemainingDeficit: Int {
		PhysiologyEngine.weightToCalories(weight: startWeight)
	}
	
	var displayRemainingDeficit: Int {
		startingRemainingDeficit - dailyDeficit
	}
	
	var realisticRemainingDeficit: Int {
		PhysiologyEngine
			.calculateRemainingDeficit(
				weight: currentAvgWeight,
				goalWeight: goalWeight
			)
	}
	
	let tdeePenalty: Int
	
	enum Difficulty: Codable {
		case preset(Preset)
		case custom(lossRate: Double)
		
	// Display
		var weeklyLossRate: Double {
			switch self {
				case let .preset(preset):
					switch preset {
						case .easy:
							return 0.5
						case .medium:
							return 0.7
						case .hard:
							return 0.9
					}
					
				case let .custom(lossRate):
					return lossRate
			}
		}
		
		// Math
		var weeklyLossRateMultiplier: Double {
			weeklyLossRate / 100
		}
		
		enum Preset: String, CaseIterable, Codable {
			case easy = "Easy"
			case medium = "Medium"
			case hard = "Hard"
		}
	}
}

  

