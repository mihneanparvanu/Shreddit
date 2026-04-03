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
		currentValue * type.caloriesPerGram
	}
}

extension Macro {
	enum MacroType: String {
		case protein, fats, carbs, fiber
		
		var caloriesPerGram: Int {
			switch self {
				case .fiber: return 2
				case .protein, .carbs: return 4
				case .fats: return 9
			}
		}
	}

}
