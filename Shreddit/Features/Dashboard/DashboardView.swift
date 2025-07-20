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
	let user: User
	
	//MARK: Environment
	@Environment(AppSettingsManager.self) var settingsManager
	@Environment(\.designSystem) var design
	
	//MARK: State
	@State private var vm = DashboardViewModel()
	
	var body: some View {
		VStack {
			TopToolbarView {
				MenuView(dietSimulatorButtonAction: {}, settingsButtonAction: {})
				
				Spacer()
				
				CurrentView(userImage: user.image)
			}
			
			DietStatsView(
				healthManager: healthManager,
				settingsManager: settingsManager
			)
			.padding(28)
			.background(design.colors.surface.base)
			.clipShape(.rect(cornerRadius: 12))
			
			Spacer()
		}
		.infinityFrame()
		.background(design.colors.surface.secondary)
		.sheet(item: $vm.sheetContent) { content in
			PresentedView(content)
		}
		.fullScreenCover(item: $vm.fullScreenContent ){ content in
			PresentedView(content)
		}
		
	}
}


#Preview {
	DashboardView(healthManager: HealthManager(),
				  user: User.preview)
		.environment(AppSettingsManager())
}
