//
//  Units.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/12/26.
//

import SwiftUI

struct Units: Codable, Sendable {
	var massUnit: MassUnit
	var energyUnit: EnergyUnit

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

	var foundationMass: UnitMass {
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

	 var foundationEnergy: UnitEnergy {
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

	enum MassUnit: String, CaseIterable, RawRepresentable, Identifiable, Codable, Sendable {
		case kg, lbs, st

		var id: Self { self }
		
		var title: String {
			switch self {
				case .kg: "Kilograms"
				case .lbs: "Pounds"
				case .st: "Stones"
			}
		}
	}

	enum EnergyUnit: String, CaseIterable, RawRepresentable, Identifiable, Codable, Sendable {
		case kcal, kj

		var id: Self { self }
		
		var title: String {
			switch self {
				case .kcal: "Kilocalories"
				case .kj: "Kilojoules"
			}
		}
	}
	
	struct Display {
		var mass: MassUnit 
		var energy: EnergyUnit
	}
}


extension EnvironmentValues {
	var units: Units.Display {
		get {
			let manager = self[AppSettingsManager.self]
			return Units
				.Display(
					mass: manager?.settings.units.massUnit ?? .kg,
					energy: manager?.settings.units.energyUnit ?? .kcal,
				)
		}
	}
}
