//
//  DBEatingEvent.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/16/26.
//

import Foundation
import SwiftData


@Model
final class DBEatingEvent {
	@Attribute(.unique) var id: String = UUID().uuidString
	var name: String
	var time: Date

	@Relationship(deleteRule: .cascade, inverse: \DBLoggedFood.event)
	var loggedFoods: [DBLoggedFood]
	
	init(name: String, time: Date, loggedFoods: [DBLoggedFood]) {
		self.name = name
		self.time = time
		self.loggedFoods = loggedFoods
	}
}
