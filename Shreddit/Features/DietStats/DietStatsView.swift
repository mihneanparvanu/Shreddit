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


#Preview {
	DietStatsView(
		healthManager: HealthManager(),
		settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

