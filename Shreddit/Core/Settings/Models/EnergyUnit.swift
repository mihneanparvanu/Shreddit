//
//  EnergyUnit.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

enum EnergyUnit: String, CaseIterable, Identifiable {
	case kjoules
	case kcalories
	
	var id: String { rawValue }
	
	var title: String {
		switch self {
				case .kjoules:
				return "Kilojoules (kJ)"
			case .kcalories:
				return "Kilocalories (kcal)"
		}
	}
}
