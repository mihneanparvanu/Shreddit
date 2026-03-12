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
	let macros: [MacroData]

	// MARK: State


    // MARK: Initializer

    var body: some View {
		VStack (spacing: Design.space.l){
            HighlightedTextView(
                highlight: .init(value: caloriesLeft),
                content: .init(beforeHighlight: "Have fun eating the rest",
							   afterHighlight: units.energy.title)
            )
			.font(.largeTitle).fontDesign(.rounded).fontWeight(.medium)
						
			HStack {
				ForEach(macros, id: \.macro) { macro in
					Spacer()
					
					HighlightedTextView(
						highlight: .init(value: macro.currentValue),
						content: .init(afterHighlight: macro.macro.rawValue)
					)
					
					Spacer()
				}
			}
        }
		.padding(.horizontal, Design.space.s)
    }
	
}

#Preview {
	let caloriesLeft = 400
	let macros = [MacroData(macro: .carbs, currentValue: 200, goal: 200),
				  MacroData(macro: .protein, currentValue: 100, goal: 150),
				  MacroData(macro: .fats, currentValue: 100, goal: 60)]
	DietaryEnergyView(caloriesLeft: caloriesLeft,
					  macros: macros)
	.previewEnvironment()
}
