//
//  LoggedFood.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftUI

struct LoggedFood {
    let foodItem: Food
    let date: Date?
    let mass: Measurement<UnitMass>
    let preparation: Food.Preparation

    init(
        foodItem: Food,
        date: Date?,
        massValue: Double,
        massUnit: Mass = .grams,
        preparation: Food.Preparation = .raw
    ) {
        self.foodItem = foodItem
        self.date = date
        mass = Measurement(value: massValue, unit: massUnit.foundationUnit)
        self.preparation = preparation
    }

    var macros: [Macro] {
        let massInGrams = mass.converted(to: .grams).value
        let rawMassInGrams: Double = switch preparation {
        case .raw: massInGrams
        case .cooked: massInGrams / foodItem.category.cookedYieldMultiplier
        }

        let foodItemMass = foodItem.mass.value
        let multiplier = rawMassInGrams / foodItemMass
        return foodItem.macros.map { $0.scaledBy(multiplier) }
    }

    var calories: Measurement<UnitEnergy> {
        let value = macros.map(\.calories.value).reduce(0, +)
        return .init(value: value, unit: .kilocalories)
    }
}

extension LoggedFood {
    enum Mass: String, CaseIterable {
        case grams, kilograms, ounces, pounds

        var foundationUnit: UnitMass {
            switch self {
            case .grams: .grams
            case .kilograms: .kilograms
            case .ounces: .ounces
            case .pounds: .pounds
            }
        }
    }
}
