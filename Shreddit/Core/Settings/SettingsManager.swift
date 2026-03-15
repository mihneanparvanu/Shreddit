//
//  SettingsManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import Observation
import SwiftUI



protocol SettingsManager {
	var settings: Settings {get set}
}

@Observable
final class AppSettingsManager: @MainActor SettingsManager {
	private let preferencesKey: String = "settings"
		

	
	var settings: Settings = .init(
		units: .init()
	) {
		didSet {
			persist()
		}
	}
	
	init() {
		if let data = UserDefaults.standard.data(forKey: preferencesKey),
		   let decoded = try? JSONDecoder().decode(Settings.self, from: data) {
			settings = decoded
		} else {
			settings = .init(units: .init())
		}
	}
	
	private func persist () {
		if let encoded = try? JSONEncoder().encode(settings) {
			UserDefaults.standard.set(encoded, forKey: preferencesKey)
		}
	}
}


