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
    var body: some Scene {
        WindowGroup {
			AppEntryView()
				.environment(settingsManager)
        }
    }
}
