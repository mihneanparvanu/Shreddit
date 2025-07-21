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
	let endWeight: Double?
	let difficulty: Difficulty
	let currentDeficit: Int

	enum Difficulty: Codable {
		case preset(preset: Preset)
		case customizable(lossRate: Double)
	}
	
	enum Preset: String, CaseIterable, Codable {
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
		
		var description: String {
			switch self {
				case .easy:
					return "Easy"
				case .medium:
					return "Medium"
				case .hard:
					return "Hard"
			}
		}
	}
}
