//
//  PhysiologyEngine.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/2/26.
//

import Foundation

enum PhysiologyEngine {

	static func calculateDailyDeficit (weight: Double, unit: UnitMass, weeklyLossRate: Double) -> Int {
		// Calories per unit of body weight lost, by unit
		let caloriesPerUnitMass: Double = switch unit {
		case .kilograms:
			7700.0
		case .pounds:
			3500.0
		case .stones:
			49000.0
		default:
			0.0
		}

		let weeklyCaloriesToLose = weeklyLossRate * caloriesPerUnitMass
		let dailyDeficit = weeklyCaloriesToLose / 7.0

		return Int(dailyDeficit.rounded())
	}
	
}

