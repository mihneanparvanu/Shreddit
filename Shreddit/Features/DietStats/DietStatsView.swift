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
	@State private var textWidth: CGFloat?
	@State private var isSheetPresented: Bool = false
	@State private var dietFatigueState: DietFatigueState?
	
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
		VStack {
			HighlightedTextView(highlight: .init(value: 16000),
								content: .init(afterHighlight: "kilocalories left in this deficit"))
			.background {
				GeometryReader { geo in
					Color.clear
						.onAppear {
							textWidth = geo.size.width
						}
				}
			}
			
			HStack {
				Button {
					isSheetPresented.toggle()
				} label : {
					Text (dietFatigueState?.description ?? "Diet fatigue log")
				}
				.infinityFrame(.width)

				Text ("10 lbs lost")
					.infinityFrame(.width)
				
				Text ("4 weeks to go")
					.infinityFrame(.width)
			}
		}
		.frame(width: textWidth)
		.sheet(isPresented: $isSheetPresented) {
			DietFatigueLog(fatigueState: $dietFatigueState)
		}
	}
}


#Preview {
	DietStatsView(
		healthManager: HealthManager(),
		settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

