//
//  DBMeal.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import Foundation
import SwiftData

@Model
final class DBMeal {
    @Attribute(.unique) var id: String = UUID().uuidString

    var name: String
	@Relationship(
		deleteRule: .cascade,
		inverse:  \DBMealIngredient.meal,
	)
	
    var ingredients: [DBMealIngredient]

    init(id: String, name: String, ingredients: [DBMealIngredient]) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
    }
}


@Model
final class DBMealIngredient {
	var massInGrams: Double
	var meal: DBMeal?
	
	@Relationship(deleteRule: .nullify)
	var foodReference: DBFood
	
	init(massInGrams: Double, foodReference: DBFood) {
		self.massInGrams = massInGrams
		self.foodReference = foodReference
	}
}
