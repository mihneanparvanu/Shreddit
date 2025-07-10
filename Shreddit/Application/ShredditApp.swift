//
//  ShredditApp.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

@main
struct ShredditApp: App {
	@State private var settingsManager = AppSettingsManager()
	@State private var onboardingState = AppOnboardingManager()
	let healthManager = HealthManager()

    var body: some Scene {
        WindowGroup {
			AppEntryView(healthManager: healthManager)
				.environment(settingsManager)
				.environment(onboardingState)
        }
    }
}
