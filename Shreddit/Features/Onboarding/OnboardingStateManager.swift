//
//  OnboardingManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import Observation
import SwiftUI

@Observable
final class OnboardingStateManager: PersistanceManager {
	var preferences: OnboardingState = .init()

	var preferencesKey: String = "onboardingState"

	func get() {
		guard let savedData = UserDefaults.standard.data(forKey: preferencesKey),
			  let savedPreferences = try? JSONDecoder().decode(OnboardingState.self, from: savedData) else
		{
			return
		}
		preferences = savedPreferences
	}

	func set () {
		if let data = try? JSONEncoder().encode(preferences) {
			UserDefaults.standard.set(data, forKey: preferencesKey)
		}
	}
}
