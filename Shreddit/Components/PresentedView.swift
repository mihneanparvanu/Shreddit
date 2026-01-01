//
//  SheetView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

extension DashboardView {
	struct PresentedView: View  {
		//MARK: Dependencies
		let content: ContentType
		
		//MARK: Environment
		@Environment(\.colorScheme) var systemScheme
		@Environment(AppSettingsManager.self) var settingsManager
		@Environment(\.dismiss) var dismiss
		
		//MARK: Initializer
		init (_ content: ContentType) {
			self.content = content
		}
		
		var body: some View {
			VStack{
				if content.presentation.isFullscreen {
					HStack {
						Spacer()
						
						Button(action: { dismiss() }){
							Image(systemName: "x.circle")
						}
						.buttonStyle(.glass)
					}
					.padding()
				}
				
				switch content {
					case .settings:
						SettingsView()
					case .faq:
						Text("FAQ")
					case .profile:
						Text("Profile")
					case .dietSimulator:
						DietSimulatorView()
					case .caloriesIn:
						EmptyView()
					case .caloriesOut:
						EmptyView()
				}
			}
			.background()
			.colorScheme(
				settingsManager.settings.appearance.colorScheme ?? systemScheme
			)
		}
	}
}

#Preview {
	DashboardView.PresentedView(.dietSimulator)
		.environment(AppSettingsManager())
}
