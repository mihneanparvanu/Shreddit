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
		HighlightedTextView(highlight: .init(value: 16000),
							content: .init(afterHighlight: "kilocalories left in this deficit"))
	}
}


#Preview {
	DietStatsView(
		healthManager: HealthManager(),
		settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

