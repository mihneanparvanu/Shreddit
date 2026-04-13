//
//  Meal.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/4/26.
//

import Foundation

struct Meal {
    let id: UUID = .init()
    let name: String
    let description: String?
    let foods: [LoggedFood]
    let time: Date

    var calories: Measurement<UnitEnergy> {
        let value = foods.map(\.calories.value).reduce(0, +)
        return .init(value: value, unit: .kilocalories)
    }

    var macros: [Macro] {
        foods.flatMap(\.macros).reduced()
    }
}
