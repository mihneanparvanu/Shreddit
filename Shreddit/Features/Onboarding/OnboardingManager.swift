//
//  OnboardingManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import Observation
import SwiftUI

@MainActor
protocol OnboardingManager {
    var state: OnboardingState { get set }
}

@Observable

final class AppOnboardingManager: @MainActor OnboardingManager {
	var preferencesKey: String = "onboardingState"
  
    var state: OnboardingState = .init() {
        didSet {
            persist()
        }
    }

    init() {
		if let data = UserDefaults.standard.data(forKey: preferencesKey),
		   let decoded = try? JSONDecoder().decode(OnboardingState.self, from: data) {
			state = decoded
		} else {
			state = .init()
		}
    }

   private func persist() {
        if let data = try? JSONEncoder().encode(preferencesKey) {
            UserDefaults.standard.set(data, forKey: preferencesKey)
        }
    }
}
