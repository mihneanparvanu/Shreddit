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
						
			HStack {
				
				ForEach(macros, id: \.kind.title) {macro in
					
					MacroView(macro)
					
				
					if macro.kind.title != macros.last?.kind.title {
						Spacer()
					}
					
					
				}
			}
			.padding(.horizontal)
			
        }
		.padding(.horizontal)
    }
	
}

#Preview {
	let caloriesLeft = 400
	
	
		
	DietaryEnergyView(caloriesLeft: caloriesLeft,
					  macros: macros)
	.previewEnvironment()
}
