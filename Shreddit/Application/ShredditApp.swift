//
//  ShredditApp.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

@main
struct ShredditApp: App {
	
	//MARK: Properties
	let healthManager = HealthManager()
	let user: User = User.preview
	
	//MARK: State
	@State private var settingsManager = AppSettingsManager()
	@State private var onboardingState = AppOnboardingManager()
	
	

    var body: some Scene {
        WindowGroup {
			AppEntryView(healthManager: healthManager,
						 user: user)
				.environment(settingsManager)
				.environment(onboardingState)
        }
    }
}
