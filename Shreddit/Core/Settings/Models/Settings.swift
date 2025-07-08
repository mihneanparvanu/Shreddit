//
//  Settings.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct Settings: Codable {
	var units: Units
	var hasOnboarded: Bool
	
	struct Units: Codable {
		var massUnit: MassUnit = .kg
		var energyUnit: EnergyUnit = .kcal
		
		enum MassUnit: CaseIterable, Identifiable, Codable {
			case kg
			case lbs
			
			var id: Self { self }
			
			var title: String {
				switch self {
					case .kg:
						return "Kilograms (kg)"
					case .lbs:
						return "Pounds (lbs)"
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


