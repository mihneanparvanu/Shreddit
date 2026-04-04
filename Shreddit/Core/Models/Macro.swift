//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct Macro  {
	let kind: Kind
	let mass: Measurement<UnitMass>
	var calories: Int {
		kind.calculateCalories(for: mass.hashValue)
	}
	
	
	init(kind: Kind, massValue: Double, massUnit: UnitMass = .grams) {
		self.kind = kind
		self.mass = Measurement(value: massValue, unit: massUnit)
	}
}

extension Macro {
	enum Kind {
		case protein, fats, carbs(fiber: Int), alcohol
		
		var title: String {
			switch self {
				case .protein: return "Protein"
				case .fats: return "Fats"
				case .carbs: return "Carbs"
				case .alcohol: return "Alcohol"
			}
		}

		func calculateCalories(for grams: Int) -> Int {
			switch self {
				case .protein: return grams * 4
				case .fats: return grams * 9
				case let .carbs(fiber):
					let netCarbs = max(0, grams - fiber)
					return netCarbs * 4 + fiber * 2
				case .alcohol: return grams * 7
			}
		}
	}
}


