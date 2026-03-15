//
//  PhysiologyEngine.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/2/26.
//

import Foundation

enum PhysiologyEngine {
	private static let caloriesPerKg: Int = 7_700
	
	static func calculateDailyDeficit(weight: Double, weeklyLossRate: Double) -> Int {
		Int((weeklyLossRate * weight) / 7) * caloriesPerKg
	}
	
	static func calculateRemainingDeficit (weight: Double, goalWeight: Double) -> Int {
		Int(weight - goalWeight) * caloriesPerKg
	}
}
