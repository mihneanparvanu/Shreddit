//
//  SettingsManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import Observation
import SwiftUI

@Observable
final class SettingsManager: PersistanceManager {
	var preferences: Settings {
		get {
			settings
		}
		set {
			settings = newValue
		}
	}
	let preferencesKey: String = "settings"
	var settings: Settings = Settings(units: Settings.Units(),
							hasOnboarded: false) {
		didSet {
			set()
		}
	}
	
	init () {
		get()
	}
	
	private func set() {
		if let encodedSettings = try? JSONEncoder().encode(settings){
			UserDefaults.standard.set(encodedSettings, forKey: preferencesKey)
		}
	}
	
	func get()  {
		guard let settingsData = UserDefaults.standard.data(forKey: preferencesKey),
			  let decodedSettings = try? JSONDecoder().decode(Settings.self, from: settingsData) else {
			return
		}
		settings = decodedSettings
	}
}
