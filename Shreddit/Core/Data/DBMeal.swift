//
//  DBMeal.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftData
import Foundation

@Model
final class DBMeal {
	@Attribute(.unique) var id: String = UUID().uuidString

	var name: String
	var ingredients: [MealIngredient]
}

struct MealIngredient: Codable {
	let dbFoodID: String
	let massInGrams: Double
}
