//
//  Food.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/3/26.
//

import Foundation

struct Food {
	let id: UUID = UUID()
	let mass: Measurement<UnitMass> = .init(value: 100, unit: .grams)
	let preparation: Preparation = .raw
	let name: String
	let photo: String?
	let category: Category
	let macros: [Macro]
	
	var calories: Int {
		macros.map(\.calories).reduce(0, +)
	}
}

extension Food {
	enum Preparation: String, CaseIterable, Codable {
		case raw
		case cooked
	}

	enum Category: String, CaseIterable, Codable {
		case meat
		case vegetable
		case fruit
		case legume
		case grain
		var cookedYieldMultiplier: Double {
			switch self {
				case .meat: return 0.7
				case .vegetable: return 0.8
				case .fruit: return 1.0
				case .legume: return 2.5
				case .grain: return 3.0
			}
		}
	}

}
