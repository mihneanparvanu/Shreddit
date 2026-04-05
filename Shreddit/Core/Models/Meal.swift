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
	
	
	
	static var sampleMeal: Meal {
		let cottageCheese = Food (
			name: "Cottage Cheese",
			photo: nil,
			category: .dairy,
			macros: [
				Macro(kind: .protein, massValue: 12.5),
				Macro(kind: .fats, massValue: 2),
				Macro(kind: .carbs, massValue: 10, fiberValue: 0, sugarValue: 2)
			]
		)
		let blueberries = Food (
			name: "Blueberries",
			photo: nil,
			category: .fruit,
			macros: [
				Macro(kind: .carbs, massValue: 13, fiberValue: 5, sugarValue: 6),
				Macro(kind: .protein, massValue: 0.5),
				Macro(kind: .fats, massValue: 0.2)])
		
			let loggedCottageCheese = LoggedFood(
				foodItem: cottageCheese,
				date: .now,
				massValue: 360)
		let loggedBlueberries = LoggedFood(
			foodItem: blueberries,
			date: .now,
			massValue: 500)

		let codingDessert = Meal(
			name: "Coding dessert",
			description: "My favorite meal of the day",
			foods: [loggedBlueberries, loggedCottageCheese],
			time: .now
		)
		return codingDessert		
	}
}



