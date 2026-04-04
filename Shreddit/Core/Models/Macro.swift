//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct Macro  {
	let type: MacroType
	let currentValue: Int
	let goal: Int
	var calories: Int {
		type.calculateCalories(for: currentValue)
	}
}

extension Macro {
	enum MacroType {
		case protein, fats, carbs(fiber: Int)

		func calculateCalories(for grams: Int) -> Int {
			switch self {
				case .protein: return grams * 4
				case .fats: return grams * 9
				case let .carbs(fiber):
					let netCarbs = max(0, grams - fiber)
					return netCarbs * 4 + fiber * 2
			}
		}
	}
}


