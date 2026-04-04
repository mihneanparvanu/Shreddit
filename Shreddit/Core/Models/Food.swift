//
//  Food.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/3/26.
//

import Foundation

struct Food {
	let macros: [Macro]
	var totalCalories: Int {
		var sum = 0
		for macro in macros {
			sum += macro.calories
		}
		return sum
	}
}

struct Meal {
	let foods: [Food]
	let time: Date
	var totalCalories: Int {
		foods.map(\.totalCalories).reduce(0, +)
	}
}
