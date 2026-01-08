//
//  SettingsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct SettingsView: View {
	//MARK: Environment
	@Environment(AppSettingsManager.self) var settingsManager
	
	var body: some View {
		Form {
			Section(header: Text("Appearance"), footer: Text("Choose your app appearance")) {
				Picker(
					"Appearance",
					selection: Binding(
						get: { settingsManager.settings.appearance },
						set: { settingsManager.settings.appearance = $0 }
					)
				) {
					ForEach(Appearance.allCases) { appearance in
						Text(appearance.title)
					}
				}
			}
			
			Section("Choose your units") {
				Picker(
					"Weight",
					selection: Binding(
						get: { settingsManager.settings.units.unitMass },
						set: { settingsManager.settings.units.unitMass = $0 }
					)
				) {
					ForEach(Settings.Units.MassUnit.allCases) { unit in
						Text(unit.rawValue)
					}
				}
				
				Picker(
					"Energy",
					selection: Binding(
						get: { settingsManager.settings.units.unitEnergy },
						set: { settingsManager.settings.units.unitEnergy = $0 }
					)
				) {
					ForEach(Settings.Units.EnergyUnit.allCases) { unit in
						Text(unit.rawValue)
					}
				}
			}
		}
		.padding(.top)
		.scrollContentBackground(.hidden)
	}
}

#Preview {
	SettingsView()
		.environment(AppSettingsManager())
}
