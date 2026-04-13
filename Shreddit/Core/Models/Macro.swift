//
//  Macro.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import Foundation

struct Macro: Codable {
    let kind: Kind
    let mass: Measurement<UnitMass>
    let fiber: Measurement<UnitMass>?
    let sugar: Measurement<UnitMass>?

    var calories: Measurement<UnitEnergy> {
        let massInGrams = mass.converted(to: .grams).value
        let unit: UnitEnergy = .kilocalories
        switch kind {
        case .protein, .fats, .alcohol:
            let exactCalories = kind.calculateCalories(for: massInGrams)
            return .init(value: exactCalories, unit: unit)

        case .carbs:
            let fiber = fiber?.converted(to: .grams).value ?? 0
            let netCarbs = massInGrams - fiber
            let totalCalories = netCarbs * 4 + fiber * 2
            return .init(value: totalCalories, unit: unit)
        }
    }

    /// Protein, Fat, Alcohol
    init(kind: Kind, massValue: Double) {
        assert(kind != .carbs, "Initializing carbs without fiber and sugar leads to inaccurate data!")

        self.kind = kind
        mass = Measurement(value: massValue, unit: .grams)
        fiber = nil
        sugar = nil
    }

    /// Carbs
    init(massValue: Double, fiberValue: Double, sugarValue: Double) {
        kind = .carbs
        mass = Measurement(value: massValue, unit: .grams)
        fiber = Measurement(value: fiberValue, unit: .grams)
        sugar = Measurement(value: sugarValue, unit: .grams)
    }
}

extension Macro {
    enum Kind: Codable, Equatable {
        case protein, fats, carbs, alcohol

        var title: String {
            switch self {
            case .protein: "Protein"
            case .fats: "Fats"
            case .carbs: "Carbs"
            case .alcohol: "Alcohol"
            }
        }

        func calculateCalories(for grams: Double) -> Double {
            switch self {
            case .protein: grams * 4
            case .fats: grams * 9
            case .carbs:
                grams * 4
            case .alcohol: grams * 7
            }
        }
    }
}

extension Macro {
    func scaledBy(_ multiplier: Double) -> Self {
        switch kind {
        case .protein, .fats, .alcohol:
            .init(kind: kind, massValue: mass.value * multiplier)
        case .carbs:
            .init(
                massValue: mass.value * multiplier,
                fiberValue: (fiber?.value ?? 0) * multiplier,
                sugarValue: (sugar?.value ?? 0) * multiplier
            )
        }
    }
}

extension Macro {
    func combined(with other: Macro) -> Macro {
        guard other.kind == kind else { return self }

        switch kind {
        case .protein, .fats, .alcohol:
            return Macro(kind: kind,
                         massValue: (mass + other.mass)
                             .converted(to: .grams).value)
        case .carbs:
            let combinedCarbs = (mass + other.mass).converted(to: .grams).value
            let zeroMass = Measurement(value: 0, unit: .grams)
            let combinedFiber = ((fiber ?? zeroMass) + (other.fiber ?? zeroMass)).converted(
                to: .grams
            ).value
            let combinedSugar = ((sugar ?? zeroMass) + (other.sugar ?? zeroMass)).converted(
                to: .grams
            ).value
            return Macro(
                massValue: combinedCarbs,
                fiberValue: combinedFiber,
                sugarValue: combinedSugar
            )
        }
    }
}
