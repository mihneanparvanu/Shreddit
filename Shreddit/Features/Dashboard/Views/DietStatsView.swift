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
		VStack (spacing: 32){
			
			HighlightedTextView(
				highlight: .init(value: vm.caloriesLeft),
				content: .init(beforeHighlight: "Have fun eating the rest",
							   afterHighlight: "kilocalories today.")
			)
			
			MacroCardView(
				goal: vm.dietaryProtein.goal,
				currentValue: vm.dietaryProtein.currentValue,
				text: .init(title: vm.dietaryProtein.title,
							unit: vm.dietaryProtein.unit),
				graph: .init(
					color: DesignConstants.Colors.Brand.primary
				)
			)
			
			VStack (spacing: 16){
				StatView(icon: .init(systemName: "shoe",
									 color: DesignConstants.Colors.Brand.primary),
						 title: "Steps today",
						 value: vm.steps,
						 unit: "steps")
				
				StatView(icon: .init(systemName: "flame",
									 color: .red),
						 title: "TDEE",
						 value: vm.tdee,
						 unit: "kilocalories")
			}
			
		}
		.alert(item: $vm.alert) { error in
			Alert(
				title: Text(error.title),
				message: Text(error.message),
				dismissButton: error.dismiss
			)
		}
		.task {
			await vm.setupAndFetch()
		}
		.onViewReady {
			Task {
				try? await vm.fetchEverything()
			}
			
		}
	}
}

//MARK: StatView

extension DietStatsView {
	struct StatView: View {
		let icon: Icon
		let title: String
		let value: Int
		let unit: String
		
		var body: some View {
			VStack {
				icon.image
					.foregroundStyle(icon.color ?? .primary)
				
				Text(title)
				
				Text(valueUnit)
					.font(.title)
			}
		}
		private var valueUnit: AttributedString {
			let value = AttributedString(value.formatted(.number))
			let unit = AttributedString(" \(unit)")
			
			return value + unit
		}
	}
}

extension DietStatsView.StatView {
	struct Icon {
		let image: Image
		let color: Color?
		
		init(resourceName: String, color: Color? = nil){
			self.image = Image(resourceName)
			self.color = color
		}
		
		init(systemName: String, color: Color){
			self.image = Image(systemName: systemName)
			self.color = color
		}
	}
}
#Preview {
	DietStatsView(healthManager: HealthManager(),
				  settingsManager: AppSettingsManager()
	)
	.environment(AppSettingsManager())
}

