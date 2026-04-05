//
//  LoggedFood.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftUI

struct LoggedFood {
	let foodItem: Food
	let date: Date
	let mass: Measurement<UnitMass>
	let preparation: Food.Preparation
	
	var macros: [Macro] {
		let massInGrams = mass.converted(to: .grams).value
		let rawMassInGrams: Double = switch preparation {
			case .raw: massInGrams
			case .cooked: massInGrams / foodItem.category.cookedYieldMultiplier
		}
		
		

		let foodItemMass = foodItem.mass.value
		let multiplier = rawMassInGrams / foodItemMass
		return foodItem.macros.map { $0.scaledBy(multiplier)}
	}
	
	var calories: Int {
		return macros.map(\.calories).reduce(0, +)
	}
}

extension LoggedFood {
	enum Mass: String, CaseIterable {
	case grams, kilograms, ounces, pounds
			
		var foundationUnit: UnitMass {
			switch self {
				case .grams: return .grams
				case .kilograms: return .kilograms
				case .ounces: return .ounces
				case .pounds: return .pounds
			}
		}
	}
}

