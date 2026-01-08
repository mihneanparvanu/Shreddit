//
//  DietStatsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct DietStatsView: View {
	//MARK: Dependencies
	let diet: Diet?
	let healthManager: HealthManager
	let settingsManager: any SettingsManager
	
	
	//MARK: State
	@State var vm: DietStatsViewModel
	@State private var isSheetPresented: Bool = false
	@State private var dietFatigueState: DietFatigueState?
	
	//MARK: Initializer
	init (diet: Diet?,
		  healthManager: HealthManager,
		  settingsManager: any SettingsManager
	) {
		self.diet = diet
		self.healthManager = healthManager
		self.settingsManager = settingsManager
		self.vm = .init(
			diet: diet,
			healthManager: healthManager,
			settingsManager: settingsManager
		)
	}
	
	
	var body: some View {
		if diet != nil {
			VStack {
				HighlightedTextView(
					highlight: .init(text: "Test"),
					content: .init(afterHighlight: "Test")
				)
			}
		}
	}
}

#Preview {
	let user = User.preview
	DietStatsView(
		diet: user.currentDiet,
		healthManager: HealthManager(),
		settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

