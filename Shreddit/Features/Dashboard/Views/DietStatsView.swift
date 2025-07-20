//
//  DietStatsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI


struct DietStatsView: View {
	//MARK: Dependencies
	let healthManager: HealthManager
	let settingsManager: any SettingsManager
	
	//MARK: State
	@State var vm: DietStatsViewModel
	
	//MARK: Initializer
	init (healthManager: HealthManager,
		  settingsManager: any SettingsManager
	) {
		self.healthManager = healthManager
		self.settingsManager = settingsManager
		self.vm = .init(
			healthManager: healthManager,
			settingsManager: settingsManager
		)
	}
	
	var body: some View {
		VStack (spacing: 32){
			
			CaloriesIn(caloriesLeft: vm.caloriesLeft,
					   protein: .init(title: vm.protein.title,
									  currentValue: vm.protein.currentValue,
									  goal: vm.protein.goal),
					   
					   carbs: .init(title: vm.carbs.title,
									currentValue: vm.carbs.currentValue,
									goal: vm.carbs.goal),
					   
					   fat: .init(title: vm.fat.title,
								  currentValue: vm.fat.currentValue,
								  goal: vm.fat.goal))
			
			Text("Calories out")
				.font(.title2)
			
				HighlightedTextView(highlight: .init(value: vm.tdee),
									content: .init(afterHighlight: "kilocalories"))
				
			
		}
		.alert(item: $vm.alert) { error in
			Alert(
				title: Text(error.title),
				message: Text(error.message),
				dismissButton: error.dismiss
			)
		}
		.task {
			await vm.setupAndFetch()
		}
		.onViewReady {
			Task {
				try? await vm.fetchEverything()
			}
		}
	}
}

extension DietStatsView {
	struct CaloriesIn: View {
		//MARK: Dependencies
		let caloriesLeft: Int
		let protein: Macro
		let carbs: Macro
		let fat: Macro
		
		var body: some View {
			Text ("Calories in")
				.font(.title2)
			
			HighlightedTextView(
				highlight: .init(value: caloriesLeft),
				content: .init(beforeHighlight: "Have fun eating the rest",
							   afterHighlight: "kilocalories today.")
			)
			
			
			HStack (spacing: 20) {
				
				
				HighlightedTextView(
					highlight: .init(value: protein.currentValue),
					content: .init(afterHighlight: protein.title)
				)
				
				HighlightedTextView(
					highlight: .init(value: carbs.currentValue),
					content: .init(afterHighlight: carbs.title)
				)
				
				HighlightedTextView(
					highlight: .init(value: carbs.currentValue),
					content: .init(afterHighlight: carbs.title)
				)
				
			}
		}
	}
}

#Preview {
	DietStatsView(healthManager: HealthManager(),
				  settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

