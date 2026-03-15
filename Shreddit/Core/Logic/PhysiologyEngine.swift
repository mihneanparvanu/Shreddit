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
}
