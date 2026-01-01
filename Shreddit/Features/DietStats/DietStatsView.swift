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
			healthManager: healthManager,
			settingsManager: settingsManager
		)
	}
	
	
	var body: some View {
		if let diet = diet {
			VStack {
				HighlightedTextView(
					highlight: .init(
						value: diet
							.currentDeficit(
								caloriesMultiplier: settingsManager.settings.units.massUnit.caloriesMultiplier)
					),
									content: .init(afterHighlight: "kilocalories left in this deficit")
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

