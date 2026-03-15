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
	let healthManager: HealthManager

	// MARK: Environment

	@Environment(\.units) var units
	// MARK: State

	@State private var vm: DashboardViewModel
	
	init(
		user: User,
		healthManager: HealthManager,
	) {
		self.user = user
		self.healthManager = healthManager
		self.vm = .init(
			healthManager: healthManager)
	}
		
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
		
		
	let macros = [MacroData(macro: .carbs, currentValue: 200, goal: 200),
					  MacroData(macro: .protein, currentValue: 100, goal: 150),
					  MacroData(macro: .fats, currentValue: 50, goal: 60)]
		
		DietaryEnergyView(caloriesLeft: user.currentDiet?.dailyDeficit ?? 0,
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
	DashboardView(user: User.preview, healthManager: HealthManager())
		.previewEnvironment()
}
