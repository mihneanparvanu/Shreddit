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
	@Environment(\.units) var units

	let caloriesLeft: Int
	let macros: [Macro]

	// MARK: State


    // MARK: Initializer

    var body: some View {
		VStack (spacing: Design.space.xxL){
            HighlightedTextView(
                highlight: .init(value: caloriesLeft),
                content: .init(beforeHighlight: "Have fun eating the rest",
							   afterHighlight: units.energy.title.lowercased())
            )
			.font(.largeTitle).fontDesign(.rounded).fontWeight(.medium)
						
			MacroCirclesView(macros: macros, size: .medium, variant: .detailed)
			
        }
		.padding(.horizontal)
    }
	
}

#Preview {
	let caloriesLeft = 400
	
	let meal = DevPreview.Meals.codingDessert
	let macros = meal.totalMacros
	

	DietaryEnergyView(caloriesLeft: caloriesLeft,
					  macros: macros)
	.previewEnvironment()
}
