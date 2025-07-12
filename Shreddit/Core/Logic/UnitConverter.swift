//
//  Logic.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 12.07.2025.
//

import Foundation

struct UnitConverter {
	func calories(forWeight weight: Double, in unit: MassUnit) -> Int {
		return Int(weight * unit.caloriesMultiplier)
	}
}
