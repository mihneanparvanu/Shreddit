//
//  Food.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/3/26.
//

import Foundation

struct Food {
	let name: String
	let photo: String?
	let mass: Measurement<UnitMass>
	let macros: [Macro]
	let preparation: Preparation
	
	var totalCalories: Int {
		var sum = 0
		for macro in macros {
			sum += macro.calories
		}
		return sum
	}
	
	init(
		name: String,
		photo: String?,
		massValue: Double,
		massUnit: Mass,
		macros: [Macro],
		preparation: Preparation
	) {
		self.name = name
		self.photo = photo
		self.mass = .init(value: massValue, unit: massUnit.foundationUnit)
		self.macros = macros
		self.preparation = preparation
	}
}


extension Food {
	
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
	
	enum Preparation: String, CaseIterable {
		case raw
		case cooked
	}
}

extension Food {
	static let chickenBreast = Food(
		name: "Chicken Breast",
		photo: nil,
		massValue: 140,
		massUnit: .grams,
		macros: [
			.init(kind: .protein, massValue: 35),
			.init(kind: .fats, massValue: 4)
		],
		preparation: .raw
	)
	
}


struct Meal {
	let foods: [Food]
	let time: Date
	var totalCalories: Int {
		foods.map(\.totalCalories).reduce(0, +)
	}
}
