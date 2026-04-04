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
	
	// MARK: Environment
	@Environment(SessionManager.self) var sessionManager
	@Environment(\.units) var units
	
	// MARK: State
	@State private var vm: DashboardViewModel
	
	init(healthManager: HealthManager)
	{
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
					variant: userViewVariant
				)
			}
			
			if let diet = user.currentDiet {
				DietDashboard(diet)
			}
			
		 else {
				StartDiet()
			}
			
			Spacer()
		}
		
			.sheet(item: $vm.sheetContent) { content in
				PresentedView(content)
			}
			.fullScreenCover(item: $vm.fullScreenContent) { content in
				PresentedView(content)
			}
	}
	
	struct StartDiet: View {
		var body: some View {
			
			Text("Get shreddit")
		}
	}
	
	struct DietDashboard: View {
		@State var diet: Diet
		
		init (_ diet: Diet) {
			self.diet = diet
		}
		
		var body: some View {
			
		let macros = [
			Macro(kind: .protein, grams: 90, goal: 180),
			Macro(kind: .carbs(fiber: 20), grams: 120, goal: 240),
			Macro(kind: .fats, grams: 100, goal: 200)
		]
			
						 
			
			DietaryEnergyView(caloriesLeft: diet.dailyDeficit,
							  macros: macros)
		}
	}
}

private extension DashboardView {
	var user: User {
		sessionManager.user
	}
	
	var userViewVariant: CurrentUserView.Variant {
		guard let diet = user.currentDiet else {
			return .compact
		}
		
		return .detailed(
			details: .init(
				highlight: .init(value: diet.daysElapsed),
				content: .init(afterHighlight: "days")
			)
		)
	}
}


#Preview {
	DashboardView(healthManager: HealthManager())
		.previewEnvironment()
}
