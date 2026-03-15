//
//  Config.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

import Foundation

/// A central place for application-wide configuration values.
enum Config {
    /// Configuration values related to the onboarding flow.
    enum Onboarding {
        /// The time after which the onboarding process resets to the welcome screen.
        static let resetInterval: TimeUnit = .days(1)
		
		static let dataRequestReason: String = "Shreddit needs acces to your health data to help you get shredded. Please allow access in your settings."
	}
}
