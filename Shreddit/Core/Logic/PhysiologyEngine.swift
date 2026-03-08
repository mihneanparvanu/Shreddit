//
//  PhysiologyEngine.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/2/26.
//

import Foundation

enum PhysiologyEngine {
	
	// Calories per unit of body weight lost, by unit
	static func caloriesPerUnitMass(_ unit : UnitMass) -> Double {
		switch unit {
		case .kilograms:
			7700.0
		case .pounds:
			3500.0
		case .stones:
			49000.0
		default:
			0.0
		}
	}
	
    static func calculateDailyDeficit(weight _: Double, unit: UnitMass, weeklyLossRate: Double) -> Int {
		let weeklyCaloriesToLose = weeklyLossRate * caloriesPerUnitMass(unit)
        let dailyDeficit = weeklyCaloriesToLose / 7.0

        return Int(dailyDeficit.rounded())
    }
	
	static func calculateDeficitRemainingInDiet (weight: Double, goalWeight: Double, unit: UnitMass) -> Int {
	let remainingWeight = weight - goalWeight
		return Int(remainingWeight * caloriesPerUnitMass(unit).rounded())
	}
	
}
