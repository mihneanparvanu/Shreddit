//
//  Food.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/3/26.
//

import Foundation

struct Food {
    let id: UUID = .init()
    let mass: Measurement<UnitMass> = .init(value: 100, unit: .grams)
    let preparation: Preparation = .raw
    let name: String
    let photo: String?
    let category: Category
    let macros: [Macro]

    var calories: Measurement<UnitEnergy> {
        let value = macros.map(\.calories.value).reduce(0, +)
        return .init(value: value, unit: .kilocalories)
    }
}

extension Food {
    enum Preparation: String, CaseIterable, Codable {
        case raw
        case cooked
    }

    enum Category: String, CaseIterable, Codable {
        case meat
        case vegetable
        case egg
        case dairy
        case fruit
        case legume
        case grain
        var cookedYieldMultiplier: Double {
            switch self {
            case .meat: 0.7
            case .vegetable: 0.8
            case .egg: 0.95
            case .dairy: 1.0
            case .fruit: 1.0
            case .legume: 2.5
            case .grain: 3.0
            }
        }
    }
}
