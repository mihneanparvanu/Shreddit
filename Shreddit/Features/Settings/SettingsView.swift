//
//  SettingsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct SettingsView: View {
	@Environment(DefaultSettingsManager.self) var settingsManager
	@Environment(\.colorScheme) var scheme
	@State private var selectedAppearance: Appearance = .system
	var body: some View {
		Form {
			Section (header: Text("Appearance"), footer:Text("Choose your app appearance"))
			{
				Picker("Appearance", selection: $selectedAppearance){
					ForEach (Appearance.allCases) {appearance in
						Text(appearance.title)
					}
				}
			}
		}
		.onChange(of: selectedAppearance){
			settingsManager.settings.appearance = selectedAppearance
		}
		.colorScheme(selectedAppearance.colorScheme ?? scheme)
	}
}

#Preview {
	SettingsView()
		.environment(DefaultSettingsManager())
}
