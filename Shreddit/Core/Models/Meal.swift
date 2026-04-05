//
//  Meal.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/4/26.
//

import Foundation

struct Meal {
	let id: UUID = UUID()
	let name: String
	let description: String?
	let foods: [LoggedFood]
	let time: Date
	
	var calories: Int {
		foods.map(\.calories).reduce(0, +)
	}
	
	var totalMacros: [Macro] {
		let dictionary = foods.flatMap(\.macros).reduce(into: [String:Macro]()) { accumulator, currentMacro in
			let key = currentMacro.kind.title
			
			if let pastValue: Macro = accumulator[key] {
				accumulator[key] = currentMacro.combined(with: pastValue)
			} else {
				accumulator[key] = currentMacro
			}
		}
		return Array(dictionary.values)
	}
}



