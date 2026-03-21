//
//  PhysiologyEngine.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/2/26.
//

import Foundation

enum PhysiologyEngine {
	private static let caloriesPerKg: Double = 7_700.0
	private static let daysInWeek: Double = 7.0
	
	static func weightToCalories(weight: Double) -> Int {
		let result = weight * caloriesPerKg
		return Int(result.rounded())
	}
	
	static func calculateDailyDeficit(weight: Double, weeklyLossMultiplier: Double) -> Int {
		let weeklyWeightLoss = weight * weeklyLossMultiplier
		let dailyWeightLoss = weeklyWeightLoss / daysInWeek
		let dailyDeficit = dailyWeightLoss * caloriesPerKg
		return Int(dailyDeficit.rounded())
	}
	
	static func calculateRemainingDeficit (weight: Double, goalWeight: Double) -> Int {
		let weightToLose = weight - goalWeight
		let caloriesRemaining = weightToLose * caloriesPerKg
		return Int(caloriesRemaining.rounded())
	}
	
	static func calculateDailyCompensation(activeLedger: Int, trueRemainingDeficit: Int) -> Int {
		let drift = trueRemainingDeficit - activeLedger
		let gamificationConfig = Config.Diet.Gamification.self
		
		if drift > 0 {
			switch drift {
				case  0..<gamificationConfig.DriftThreshold.minor:
					return gamificationConfig.Penalty.low
				case gamificationConfig.DriftThreshold.minor..<gamificationConfig.DriftThreshold.major:
					return gamificationConfig.Penalty.mid
				default: return gamificationConfig.Penalty.hi
			}
		}
		return 0
	}
	
	static func compensateForDay (oldTDEE: Int, healthTDEE: Int, energyIntake: Int, oldLedger: Int, weight: Double, goalWeight: Double) -> CompensationResult {
		
	// Calculate gamified TDEE
		let gamifiedTDEE = oldTDEE - healthTDEE
		
	// See the drift
		let deficit = gamifiedTDEE - energyIntake
		
		let activeLedger = oldLedger - deficit
		
		let trueRemainingDeficit = PhysiologyEngine.calculateRemainingDeficit(
			weight: weight,
			goalWeight: goalWeight
		)
		
		let drift = PhysiologyEngine.calculateDailyCompensation(
			activeLedger: activeLedger,
			trueRemainingDeficit: trueRemainingDeficit
		)
		
		let newTDEE = oldTDEE - drift
		
		return CompensationResult(activeLedger: activeLedger, newTDEE: newTDEE)
	}
	
	struct CompensationResult {
		let activeLedger: Int
		let newTDEE: Int
	}
}
