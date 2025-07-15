//
//  DietSimulatorView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import SwiftUI

struct DietSimulatorView: View {
	
	//MARK: Environment
	@Environment(AppSettingsManager.self) var settingsManager
	
	//MARK: State
	@State private var weightToLose: Double = 0
	
    var body: some View {
		VStack{
			Text("Diet simulator")
				.font(.title)
				.foregroundStyle(.gray)

			Text("How much weight do you want to lose?")
			HStack (spacing: 2){
				TextField("Weight to lose", value: $weightToLose, format: .number)
			
				
				Text(settingsManager.settings.units.massUnit.rawValue)
			}
			
			HighlightedTextView(highlight: .init(value: caloriesLeftInDeficit),
								content: .init(afterHighlight: "kilocalories left in deficit"))
			
			Spacer()
		}
		.background()
    }
}

extension DietSimulatorView {
	var caloriesLeftInDeficit: Int {
		Int(weightToLose * settingsManager.settings.units.massUnit.caloriesMultiplier)
	}
}

#Preview {
    DietSimulatorView()
		.environment(AppSettingsManager())
}
