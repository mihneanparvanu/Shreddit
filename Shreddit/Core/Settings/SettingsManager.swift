//
//  SettingsManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import Observation
import SwiftUI

protocol SettingsManager: PreferencesManager {
	var settings: Settings {get set}
}

@Observable
final class AppSettingsManager: @MainActor SettingsManager {
	var preferences: Settings {
		get {
			settings
		}
		set {
			settings = newValue
		}
	}
		
	private func persist () {
		if let encoded = try? JSONEncoder().encode(settings) {
			UserDefaults.standard.set(encoded, forKey: preferencesKey)
		}
	}

	let preferencesKey: String = "settings"

	var settings: Settings = .init(
		units: .init()
	) {
		didSet {
			persist()
		}
	}
	
	init() {
		get()
	}

	func get() {
		guard let settingsData = UserDefaults.standard.data(forKey: preferencesKey),
		      let decodedSettings = try? JSONDecoder().decode(Settings.self, from: settingsData)
		else {
			return
		}
		settings = decodedSettings
	}
}
