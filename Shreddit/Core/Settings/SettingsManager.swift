//
//  SettingsManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import Observation
import SwiftUI

protocol SettingsManager: PreferencesManager {
	var settings: Settings { get set }
}

@Observable
final class AppSettingsManager: SettingsManager {
	
	var preferences: Settings {
		get {
			settings
		}
		set {
			settings = newValue
		}
	}
	let preferencesKey: String = "settings"
	
	var settings: Settings = Settings(
		units: .init()
	) {
		didSet {
			set ()
		}
	}
	
	init () {
		get()
	}
	
	func get() {
		guard let settingsData = UserDefaults.standard.data(forKey: preferencesKey),
			  let decodedSettings = try? JSONDecoder().decode(Settings.self, from: settingsData) else {
			return
		}
		settings = decodedSettings
	}
	
	private func set() {
		if let encodedSettings = try? JSONEncoder().encode(settings){
			UserDefaults.standard.set(encodedSettings, forKey: preferencesKey)
		}
	}
}
