//
//  OnboardingManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import Observation
import SwiftUI

protocol OnboardingManager: PreferencesManager {
	var state: OnboardingState { get set }
}

@Observable
final class AppOnboardingManager: OnboardingManager {
	
	var preferences: OnboardingState {
		get {
			state
		}
		set {
			state = newValue
		}
	}
	var preferencesKey: String = "onboardingState"
	
	var state: OnboardingState = .init() {
		didSet {
			set()
		}
	}
	
	init () {
		get()
	}

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
