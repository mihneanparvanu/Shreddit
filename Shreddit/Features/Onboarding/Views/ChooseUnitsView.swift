//
//  ChooseUnitsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

struct ChooseUnitsView: View {
	@Binding var selectedUnits: Units
	
	var body: some View {
		Form {
			Section ("Choose your units") {
				Picker("Weight", selection: $selectedUnits.massUnit) {
					ForEach (Units.MassUnit.allCases) {unit in
						Text(unit.title)
					}
				}
				
				Picker("Energy", selection: $selectedUnits.energyUnit) {
					ForEach(Units.EnergyUnit.allCases){unit in
						Text(unit.title)
					}
				}
			}
		}
	}
}
#Preview {
	@Previewable @State var selectedUnits: Units = Units()
	ChooseUnitsView(selectedUnits: $selectedUnits)
}


