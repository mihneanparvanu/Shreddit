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
				Picker("Weight", selection: $selectedUnits.massUnit) {
					ForEach (MassUnit.allCases) {unit in
						Text(unit.description)
					}
				}
				
				Picker("Energy", selection: $selectedUnits.energyUnit) {
					ForEach(EnergyUnit.allCases){unit in
						Text(unit.title)
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


