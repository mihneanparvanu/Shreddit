//
//  Config.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

import Foundation

/// A central place for application-wide configuration values.
enum Config {
	
	// MARK: - Onboarding
	enum Onboarding {
		static let resetInterval: TimeUnit = .days(1)
		static let dataRequestReason: String = "Shreddit needs access to your health data to help you get shredded. Please allow access in your settings."
	}

	// MARK: - Diet Engine
	enum Diet {
		/// The biological constant used across the app (Calories per Kg of Body Fat)
		static let caloriesPerKgOfFat: Double = 7700.0
		
		/// Configuration for the silent background reconciliation engine
		enum Gamification {
			
			/// The calorie drift limits that trigger a change in penalty
			enum DriftThreshold {
				static let minor: Int = 1500
				static let major: Int = 3500
			}
			
			/// The daily calorie amounts silently subtracted from TDEE to fix the drift
			enum Penalty {
				static let low: Int = 100
				static let mid: Int = 200
				static let hi: Int = 300
			}
		}
	}
}
