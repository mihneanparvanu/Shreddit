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
				
				UserView(user: user)
					.userViewVariant(userViewVariant)
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
}

private extension DashboardView {
	var user: User {
		sessionManager.user
	}
	
	var userViewVariant: UserView.Variant {
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

private extension DashboardView {
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
			
			
			VStack (spacing: 20){
				DietaryEnergyView(
					energyLeft: caloriesLeft,
					macros: meals[0].totalMacros
				)
				
				ForEach(meals, id: \.id) { meal in
					MealCard(meal)
				}
			}
		}
	}
		
}

private extension DashboardView.DietDashboard {
	var meals: [Meal] {
		return [
		DevPreview.Meals.shreddedBreakfast,
		DevPreview.Meals.powerLunch,
		DevPreview.Meals.codingDessert
		]
	}
	
	var macros: [Macro] {
		return meals.flatMap(\.totalMacros)
	}
	
	
	var caloriesLeft: Int {
		let tdee = 1760.0 + 970.0
		let dietaryEnergy = meals.compactMap(\.calories.value).reduce(0, +)
		let caloriesLeft = Int((tdee - dietaryEnergy).rounded()) - diet.dailyDeficit
		return caloriesLeft
	}
}

#Preview {
	DashboardView(healthManager: HealthManager())
		.previewEnvironment()
}
