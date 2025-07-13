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
					vm.sheetContent = .settings
				},
				dietSimulatorButtonAction: {
					vm.fullScreenContent = .dietSimulator
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
		.sheet(item: $vm.sheetContent){ content in
			SheetContent(content)
		}
		.fullScreenCover(item: $vm.fullScreenContent) { content in
			SheetContent(content)
		}
	}
}


#Preview {
	DashboardView(healthManager: HealthManager())
		.environment(AppSettingsManager())
}
