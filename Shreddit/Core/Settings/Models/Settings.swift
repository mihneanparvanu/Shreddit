//
//  Settings.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI
typealias Appearance = Settings.Appearance
typealias Units = Settings.Units
typealias MassUnit = Units.MassUnit
typealias EnergyUnit = Units.EnergyUnit


struct Settings: Codable {
	var appearance: Appearance = .system
	var units: Units = Units()

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
		var massUnit: MassUnit = .kg
		var energyUnit: EnergyUnit = .kcal
		
		enum MassUnit: String, CaseIterable, Identifiable, Codable {
			case kg
			case lbs
			
			var id: Self { self }
			
			var description: String {
				switch self {
					case .kg:
						return "Kilograms (kg)"
					case .lbs:
						return "Pounds (lbs)"
				}
			}
			
			var caloriesMultiplier: Double {
				switch self {
					case .kg:
						return 7700
					case .lbs:
						return 3500
				}
			}
		}

		enum EnergyUnit: CaseIterable, Identifiable, Codable{
			case kcal
			case kjoules

			var id: Self { self }
			
			var title: String {
				switch self {
						case .kjoules:
						return "Kilojoules (kJ)"
					case .kcal:
						return "Kilocalories (kcal)"
				}
			}
		}
	}
}


