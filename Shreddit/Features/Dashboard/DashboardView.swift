//
//  DashboardView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	// MARK: Dependencies

	@State var user: User

	// MARK: Environment

	@Environment(HealthManager.self) var healthManager
	@Environment(AppSettingsManager.self) var settingsManager

	// MARK: State

	@State private var vm = DashboardViewModel()

	var body: some View {
		VStack {
			TopToolbarView {
				Text(Date.now.formatted(.dateTime.month(.wide).day()))
				Spacer()
				CurrentUserView(
					user: user,
					variant:
							.detailed(
								details: .init(
									highlight: .init(
										value: user.currentDiet?.daysElapsed
									),
									content: .init(afterHighlight: "days")
								)
							)
				)
			}
		}
		
		
		DietView(
			diet: user.currentDiet,
			healthManager: healthManager,
			settingsManager: settingsManager
		)
		
		let macros = [MacroData(macro: .carbs, currentValue: 200, goal: 200),
					  MacroData(macro: .protein, currentValue: 100, goal: 150),
					  MacroData(macro: .fats, currentValue: 100, goal: 60)]
		
		DietaryEnergyView(caloriesLeft: 600,
						  macros: macros)

		Spacer()
		
			.infinityFrame()
			.sheet(item: $vm.sheetContent) { content in
				PresentedView(content)
			}
			.fullScreenCover(item: $vm.fullScreenContent) { content in
				PresentedView(content)
			}
	}

}


#Preview {
	DashboardView(user: User.preview)
		.previewEnvironment()
}
