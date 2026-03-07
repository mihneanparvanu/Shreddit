//
//  DashboardView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	// MARK: Dependencies

	let healthManager: HealthManager
	@State var user: User

	// MARK: Environment

	@Environment(AppSettingsManager.self) var settingsManager
	@Environment(\.designSystem) var design

	// MARK: State

	@State private var vm = DashboardViewModel()

	var body: some View {
		VStack {
			TopToolbarView {
				Text(Date.now.formatted(date: .long, time: .omitted))
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
		
		
		DietStatsView(
			diet: user.currentDiet,
			healthManager: healthManager,
			settingsManager: settingsManager
		)

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
	DashboardView(healthManager: HealthManager(),
	              user: User.preview)
		.environment(AppSettingsManager())
}
