//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct Macro: Codable {
	let kind: Kind
	let mass: Measurement<UnitMass>
	let fiber: Measurement<UnitMass>?
	let sugar: Measurement<UnitMass>?
	
	var calories: Int {
		let massInGrams = mass.converted(to: .grams).value
		switch kind {
			case .protein, .fats, .alcohol:
				let exactCalories = kind.calculateCalories(for: massInGrams)
				return Int(exactCalories.rounded())
				
			case.carbs:
				let fiber = fiber?.converted(to: .grams).value ?? 0
				let netCarbs = massInGrams - fiber
				let totalCalories = netCarbs * 4 + fiber * 2
				return Int(totalCalories.rounded())
		}
		
	}
	
	/// Protein, Fat, Alcohol
	init(kind: Kind, massValue: Double) {
		assert(kind != .carbs, "Initializing carbs without fiber and sugar leads to inaccurate data!")
		
		self.kind = kind
		self.mass = Measurement(value: massValue, unit: .grams)
		self.fiber = nil
		self.sugar = nil
	}
	
	/// Carbs
	init (massValue: Double, fiberValue: Double, sugarValue: Double) {
		self.kind = .carbs
		self.mass = Measurement(value: massValue, unit: .grams)
		self.fiber = Measurement(value: fiberValue, unit: .grams)
		self.sugar = Measurement(value: sugarValue, unit: .grams)
	}
}

extension Macro {
	enum Kind: Codable, Equatable {
		case protein, fats, carbs, alcohol
		
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
				case .carbs:
					return grams * 4
				case .alcohol: return grams * 7
			}
		}
	}
}

extension Macro {
	func scaledBy(_ multiplier: Double) -> Self {
		switch kind {
			case .protein, .fats, .alcohol:
				return .init(kind: kind, massValue: mass.value * multiplier)
			case .carbs:
				return .init(
					massValue: mass.value * multiplier,
					fiberValue: (fiber?.value ?? 0) * multiplier,
					sugarValue: (sugar?.value ?? 0) * multiplier
				)
		}
	}
}

extension Macro {
	func combined (with other: Macro) -> Macro {
	
		guard other.kind.title == kind.title else { return self }
		
		switch kind {
			case .protein, .fats, .alcohol:
				return  Macro (kind: self.kind,
							   massValue: self.mass.value + other.mass.value)
			case .carbs:
				return Macro(
					massValue: self.mass.value + other.mass.value,
					fiberValue: (self.fiber?.value ?? 0) + (other.fiber?.value ?? 0),
					sugarValue: (self.sugar?.value ?? 0) + (other.sugar?.value ?? 0)
				)
		}
	}
}

