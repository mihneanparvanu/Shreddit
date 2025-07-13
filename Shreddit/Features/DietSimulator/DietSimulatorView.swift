//
//  DietSimulatorView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import SwiftUI

struct DietSimulatorView: View {
	
	@Environment(AppSettingsManager.self) var settingsManager
	
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
			CaloriesInDeficitView(weightToLose: weightToLose)
			
			Spacer()
		}
		.background()
    }
}

#Preview {
    DietSimulatorView()
		.environment(AppSettingsManager())
}
