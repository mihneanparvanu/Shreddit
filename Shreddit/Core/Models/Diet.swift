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
	let currentWeight: Double
	let goalWeight: Double
	let difficulty: Difficulty
	var settings: Settings?
	
	func currentDeficit () -> Int {
		Int((currentWeight * (settings?.units.massUnit.weightToCalories ?? 0) * (difficulty.weeklyLossRate / 100)) / 7)
	}
	
	enum Difficulty: Codable {
		case preset(Preset)
		case custom(lossRate: Double)
		
		var weeklyLossRate: Double {
			switch self {
				case .preset(let preset):
					switch preset {
						case .easy:
							return 0.5
						case .medium:
							return 0.7
						case .hard:
							return 0.9
					}
					
				case .custom(let lossRate):
					return lossRate
			}
		}
	}
	
	enum Preset: String, CaseIterable, Codable {
		case easy = "Easy"
		case medium = "Medium"
		case hard = "Hard"
	}
}
