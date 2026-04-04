//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct Macro: Codable  {
	let kind: Kind
	let mass: Measurement<UnitMass>
	var calories: Int {
		let massInGrams = mass.converted(to: .grams).value
		let exactCalories = kind.calculateCalories(for: massInGrams)
		return Int(exactCalories.rounded())
	}
	
	func scaledBy(_ multiplier: Double) -> Self {
		switch kind {
			case .protein, .fats, .alcohol:
				return .init(kind: kind, massValue: mass.value * multiplier)
			case let .carbs(fiber):
				return .init(
					kind: .carbs(fiber: fiber * multiplier),
					massValue: mass.value * multiplier
				)
		}
	}
	
	init(kind: Kind, massValue: Double, massUnit: UnitMass = .grams) {
		self.kind = kind
		self.mass = Measurement(value: massValue, unit: massUnit)
	}
}

extension Macro {
	enum Kind: Codable {
		case protein, fats, carbs(fiber: Double), alcohol
		
		var title: String {
			switch self {
				case .protein: return "Protein"
				case .fats: return "Fats"
				case .carbs: return "Carbs"
				case .alcohol: return "Alcohol"
			}
		}

		func calculateCalories(for grams: Double) -> Double {
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


