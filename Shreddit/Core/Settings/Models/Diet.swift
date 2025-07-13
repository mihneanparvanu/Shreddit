//
//  Diet.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import Foundation

struct Diet: Identifiable, Codable {
	var id: String { "Diet \(startDate) - \(endDate)"}
	let startDate: Date
	let endDate: Date
	let difficulty: DietDifficulty
	
	enum DietDifficulty: Codable {
		case preset(preset: DietPreset)
		case customizable(lossRate: Double)
	}
	
	enum DietPreset: String, CaseIterable, Codable {
		case easy
		case medium
		case hard
		
		var lossRate: Double {
			switch self {
				case .easy:
					return 0.5
				case .medium:
					return 0.7
				case .hard:
					return 0.9
			}
		}
	}
}
