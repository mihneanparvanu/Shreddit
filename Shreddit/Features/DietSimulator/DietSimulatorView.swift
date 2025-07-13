//
//  DietSimulatorView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import SwiftUI

struct DietSimulatorView: View {
	@State private var weightToLose: Double = 0
    var body: some View {
		VStack{
		
			Text("Diet simulator")
				.font(.title)
				.foregroundStyle(.gray)

			Text("How much weight do you want to lose?")
			HStack (spacing: 2){
				TextField("Weight to lose", value: $weightToLose, format: .number)
					.frame(width: 44)
				
				Text("kg")
			}
			.padding()
		
			CaloriesInDeficitView(weightToLose: weightToLose)
			
			Spacer()
		}
    }
}

#Preview {
    DietSimulatorView()
		.environment(AppSettingsManager())
}
