//
//  ContentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	//MARK: Dependencies
	let healthManager: HealthManager
	
	//MARK: Environment
	@Environment(AppSettingsManager.self) var settingsManager
	
	//MARK: State
	@State private var vm = DashboardViewModel()
	
	var body: some View {
		VStack {
			TopToolbarView (
				settingsButtonAction: {
					vm.presentedContent = .settings
				},
				dietSimulatorButtonAction: {
					vm.presentedContent = .dietSimulator
				}
			)
				
			DietStatsView(
				healthManager: healthManager,
				settingsManager: settingsManager
			)
			
			Spacer()
		}
		.infinityFrame()
		.background()
		.sheet(item: $vm.sheetContent) { content in
			PresentedView(content)
		}
		.fullScreenCover(item: $vm.fullScreenContent ){ content in
			PresentedView(content)
		}
	}
}


#Preview {
	DashboardView(healthManager: HealthManager())
		.environment(AppSettingsManager())
}
