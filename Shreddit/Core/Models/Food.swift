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

