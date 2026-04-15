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
    var ingredients: [DBMealIngredient] = []

    init(name: String) {
        self.name = name
    }
}


@Model
final class DBMealIngredient {
	var meal: DBMeal?
	
	@Relationship(deleteRule: .nullify)
	var foodReference: DBFood

	var massInGrams: Double

	init(foodReference: DBFood, massInGrams: Double) {
		self.foodReference = foodReference
		self.massInGrams = massInGrams
	}
}
