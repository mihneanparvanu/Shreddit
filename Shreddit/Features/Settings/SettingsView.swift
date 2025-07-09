//
//  SettingsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct SettingsView: View {
	@Environment(SettingsManager.self) var settingsManager
	@Environment(\.colorScheme) var scheme
	var body: some View {
		Form {
			Section (header: Text("Appearance"), footer:Text("Choose your app appearance"))
			{
				Picker(
					"Appearance",
					selection: Binding(
						get: { settingsManager.settings.appearance },
						set: { settingsManager.settings.appearance = $0 }
					)
				){
					ForEach (Appearance.allCases) {appearance in
						Text(appearance.title)
					}
				}
			}
		}
		.colorScheme(settingsManager.settings.appearance.colorScheme ?? scheme)

	}
}

#Preview {
	SettingsView()
		.environment(SettingsManager())
}
