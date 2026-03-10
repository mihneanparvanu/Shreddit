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
		.environment(AppSettingsManager())
}
