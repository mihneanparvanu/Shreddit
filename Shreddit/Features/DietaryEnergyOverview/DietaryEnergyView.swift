//
//  CaloriesInView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct DietaryEnergyView: View {
    // MARK: Dependencies

	@Environment(HealthManager.self) var healthManager

	let energyLeft: Int
	let macros: [Macro]

	// MARK: State


    // MARK: Initializer

    var body: some View {
		VStack (spacing: Design.space.l){
		
			if energyLeft > 0 {
				EnergyLeft(energyLeft)
			} else {
				EnergyExceeded()
			}
          						
			MacroCirclesView(macros, spacing: .spaceBetween)
			
        }
    }
	
}

private extension DietaryEnergyView {
	struct EnergyLeft: View {
		
		@Environment(\.units) var units
		
		let energyLeft: Int
		init(_ energyLeft: Int) {
			self.energyLeft = energyLeft
		}
		var body: some View {
			
			if energyLeft > 0 {
				HighlightedTextView(
					highlight: .init(value: energyLeft),
					content: .init(beforeHighlight: "Have fun eating the rest",
								   afterHighlight: units.energyUnit.title)
				)
				.font(.largeTitle).fontDesign(.rounded).fontWeight(.medium)
			}
		
		}
	}
	
	struct EnergyExceeded: View {
		var body: some View {
			HighlightedTextView(
				highlight: .init(text: "You are a failure"), content: .init())
			.font(.largeTitle).fontDesign(.rounded).fontWeight(.medium)
		}
	}
}

#Preview {
	let caloriesLeft = 400
	
	let meal = DevPreview.Meals.codingDessert
	let macros = meal.totalMacros
	

	DietaryEnergyView(energyLeft: caloriesLeft,
					  macros: macros)
	.previewEnvironment()
}
