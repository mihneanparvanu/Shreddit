//
//  ShredditApp.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

@main
struct ShredditApp: App {
    // MARK: Properties

    // MARK: State
	@State private var sessionManager = SessionManager(user: .preview)
	@State private var healthManager = HealthManager()
	@State private var settingsManager = AppSettingsManager()
    @State private var onboardingManager = AppOnboardingManager()

    var body: some Scene {
        WindowGroup {
            AppEntryView()
				.environment(sessionManager)
				.environment(healthManager)
                .environment(settingsManager)
                .environment(onboardingManager)
        }
    }
}
