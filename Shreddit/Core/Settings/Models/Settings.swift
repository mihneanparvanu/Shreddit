//
//  Settings.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

typealias Appearance = Settings.Appearance
typealias Units = Settings.Units

struct Settings: Codable {
    var appearance: Appearance = .system
    var units: Units

    enum Appearance: CaseIterable, Identifiable, Codable {
        case light
        case dark
        case system

        var id: Self { self }

        var title: String {
            switch self {
            case .light:
                return "Light"
            case .dark:
                return "Dark"
            case .system:
                return "System"
            }
        }

        var colorScheme: ColorScheme? {
            switch self {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }
    }

    struct Units: Codable {
        private var massUnit: MassUnit
        private var energyUnit: EnergyUnit

        init(massUnit: MassUnit? = nil, energyUnit: EnergyUnit = .kcal) {
            if let massUnit = massUnit {
                self.massUnit = massUnit
            } else {
                let locale = Locale.current
                switch locale.measurementSystem {
                case .metric:
                    self.massUnit = .kg
                case .us:
                    self.massUnit = .lbs
                case .uk:
                    self.massUnit = .st
                default:
                    self.massUnit = .kg
                }
            }
            self.energyUnit = energyUnit
        }

        var unitMass: UnitMass {
            get {
                switch massUnit {
                case .kg:
                    return .kilograms
                case .lbs:
                    return .pounds
                case .st:
                    return .stones
                }
            }

            set {
                switch newValue {
                case .kilograms:
                    massUnit = .kg
                case .pounds:
                    massUnit = .lbs
                case .stones:
                    massUnit = .st
                default: break
                }
            }
        }

        var unitEnergy: UnitEnergy {
            get {
                switch energyUnit {
                case .kcal:
                    return .kilocalories
                case .kj:
                    return .kilojoules
                }
            }
            set {
                switch newValue {
                case .kilocalories:
                    energyUnit = .kcal
                case .kilojoules:
                    energyUnit = .kj
                default: break
                }
            }
        }

        enum MassUnit: String, CaseIterable, RawRepresentable, Identifiable, Codable {
            case kg, lbs, st

            var id: Self { self }
        }

        enum EnergyUnit: String, CaseIterable, RawRepresentable, Identifiable, Codable {
            case kcal, kj

            var id: Self { self }
        }
    }
}
