//
//  ShredditApp.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

@main
struct ShredditApp: App {
	@State private var settingsManager = DefaultSettingsManager()
	@Environment(\.colorScheme) var systemScheme
    var body: some Scene {
        WindowGroup {
			AppEntryView()
				.colorScheme(userColorScheme ?? systemScheme)
				.environment(settingsManager)
        }
    }
}

extension ShredditApp {
	private var userColorScheme: ColorScheme? {
		settingsManager.settings.appearance.colorScheme
	}
}
