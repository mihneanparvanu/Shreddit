//
//  ChooseUnitsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

struct OnboardingPreferencesView: View {
	@Binding var appearance: Appearance
	@Binding var selectedUnits: Units
	
	var body: some View {
		Form {
			Section ("Choose your appearance") {
				Picker ("Appearance", selection: $appearance) {
					ForEach (Appearance.allCases) {scheme in
						Text (scheme.title)
					}
				}
			}
			Section ("Choose your units") {
				Picker("Weight", selection: $selectedUnits.unitMass) {
					ForEach (Settings.Units.MassUnit.allCases) {unit in
						Text(unit.rawValue)
					}
				}
				
				Picker("Energy", selection: $selectedUnits.unitEnergy) {
					ForEach(Settings.Units.EnergyUnit.allCases) {unit in
						Text(unit.rawValue)
					}
				}
			}
		}
		.scrollContentBackground(.hidden)
	}
}
#Preview {
	@Previewable @State var selectedUnits: Units = Units()
	@Previewable @State var appearance: Appearance = .system
	OnboardingPreferencesView(appearance: $appearance,
							  selectedUnits: $selectedUnits)
}


