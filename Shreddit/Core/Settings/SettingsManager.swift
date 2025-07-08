//
//  SettingsManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import Observation
import SwiftUI

protocol SettingsManager {
	var settings: Settings { get set }
	var settingsKey: String { get }
	
	func getSettings()
}

@Observable
final class DefaultSettingsManager: SettingsManager {
	let settingsKey: String = "settings"
	var settings = Settings(units: Settings.Units(),
							hasOnboarded: false) {
		didSet {
			print ("Settings updated")
			save()
		}
	}
	
	init () {
		print ("Settings initialized")
		print (settings)
		getSettings()
	}
	
	private func save() {
		if let encodedSettings = try? JSONEncoder().encode(settings){
			UserDefaults.standard.set(encodedSettings, forKey: settingsKey)
		}
	}
	
	func getSettings()  {
		guard let settingsData = UserDefaults.standard.data(forKey: settingsKey),
			  let decodedSettings = try? JSONDecoder().decode(Settings.self, from: settingsData) else {
			return
		}
		settings = decodedSettings
	}
}
