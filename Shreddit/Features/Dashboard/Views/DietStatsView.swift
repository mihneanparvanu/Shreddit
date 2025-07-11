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
	
	//MARK: State
	@State var vm: DietStatsViewModel
	
	//MARK: Initializer
	init (healthManager: HealthManager) {
		self.healthManager = healthManager
		self.vm = .init(healthManager: healthManager)
	}
	
	var body: some View {
		VStack (spacing: 32){
			
			CaloriesLeftView(caloriesLeft: vm.caloriesLeft)
			
			VStack (spacing: 16){
				StatView(icon: .init(systemName: "shoe",
									 color: .brandPrimary),
						 title: "Steps today",
						 value: vm.steps,
						 unit: "kilocalories")
				
				StatView(icon: .init(systemName: "flame",
									 color: .red),
						 title: "TDEE",
						 value: vm.totalEnergyBurned,
						 unit: "kilocalories")
			}
			
		}
		.padding()
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
				Image(systemName: icon.systemName)
					.imageScale(.large)
					.foregroundStyle(icon.color)
				
				Text(title)
				
				Text(valueUnit)
					.font(.title)
			}
		}
		private var valueUnit: AttributedString {
			let value = AttributedString(value.formatted(.number))
			let unit = AttributedString(unit)
			
			return value + unit
		}
	}
}

extension DietStatsView.StatView {
	struct Icon {
		let systemName: String
		let color: Color
	}
}
#Preview {
	DietStatsView(healthManager: HealthManager())
}
