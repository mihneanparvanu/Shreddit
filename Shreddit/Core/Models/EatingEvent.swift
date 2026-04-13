//
//  EatingEvent.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/7/26.
//

import Foundation

struct EatingEvent {
    let name: String
    let date: Date
    let meal: Meal?
    let loggedFoods: [LoggedFood]?

    /// Passing a custom meal
    init(name: String, date: Date, meal: Meal?) {
        self.name = name
        self.date = date
        self.meal = meal
        loggedFoods = nil
    }

    /// Passing logged foods
    init(name: String, date: Date, loggedFoods: [LoggedFood]) {
        self.name = name
        self.date = date
        meal = nil
        self.loggedFoods = loggedFoods
    }
}
