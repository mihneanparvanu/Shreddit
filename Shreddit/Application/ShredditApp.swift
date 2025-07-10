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
	@Environment(\.colorScheme) var systemScheme
    var body: some Scene {
        WindowGroup {
			AppEntryView()
				.colorScheme(settingsManager.settings.appearance.colorScheme ?? systemScheme)
				.environment(settingsManager)
				.environment(onboardingState)
        }
    }
}
