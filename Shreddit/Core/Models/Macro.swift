//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct MacroData {
	let macro: Macro
    var currentValue: Int
    var goal: Int
}

enum Macro: String {
	case protein, fats, carbs, fiber
	
	var caloriesPerGram: Int {
		switch self {
			case .fiber: return 2
			case .protein, .carbs: return 4
			case .fats: return 9
		}
	}
}
