//
//  DBLoggedFood.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/16/26.
//

import Foundation
import SwiftData

@Model
final class DBLoggedFood {
	@Attribute(.unique) var id: String = UUID().uuidString
	var time: Date

	var event: DBEatingEvent?
	
	@Relationship(deleteRule: .nullify)
	var foodReference: DBFood?

	var massInGrams: Double
	
	init(time: Date, foodReference: DBFood, massInGrams: Double) {
		self.time = time
		self.foodReference = foodReference
		self.massInGrams = massInGrams
	}
}
