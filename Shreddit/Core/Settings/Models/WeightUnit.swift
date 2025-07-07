//
//  WeightUnit.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//


enum WeightUnit: String, CaseIterable, Identifiable {
	case kg
	case lbs
	
	var id: String { rawValue }
	
	var title: String {
		switch self {
			case .kg:
				return "Kilograms (kg)"
			case .lbs:
				return "Pounds (lbs)"
		}
	}
}
