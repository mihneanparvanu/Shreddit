//
//  SheetView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

extension DashboardView {
	struct SheetContent: View  {
		//MARK: Dependencies
		let content: ContentType
		
		//MARK: Environment
		@Environment(\.colorScheme) var systemScheme
		@Environment(AppSettingsManager.self) var settingsManager
		
		//MARK: Initializer
		init (_ content: ContentType) {
			self.content = content
		}
		
		var body: some View {
			Group{
				switch content {
					case .settings:
						SettingsView()
					case .faq:
						Text("FAQ")
					case .profile:
						Text("Profile")
					case .dietSimulator:
						DietSimulatorView()
				}
			}
			.background()
			.colorScheme(
				settingsManager.settings.appearance.colorScheme ?? systemScheme
			)
		}
	}
}
