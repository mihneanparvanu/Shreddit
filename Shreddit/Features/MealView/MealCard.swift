//
//  MealView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/7/26.
//

import SwiftUI

struct MealCard: View {
	
	let meal: Meal
	
	@Environment(\.units) var units
	
	init(_ meal: Meal) {
		self.meal = meal
	}
	
	var body: some View {
		
		
		VStack(alignment: .leading){
			Text(meal.name)
				.font(.title3)
			
			HStack {
				MacroCirclesView(
					macros: meal.totalMacros)
				.macroStyle(size: .small, variant: .compact)
				
				
				ForEach(meal.foods, id: \.foodItem.id) { food in
					Text(food.foodItem.name)
				}
				Spacer()
				
				let displayCalories = units.conver(
					meal.calories
				).valueUnitDisplay
				
				Text(displayCalories)
			}
			.font(.caption)
			.foregroundStyle(Color(.systemGray2))

		}
		.padding()
		.background(Color(.systemGray6))
		.overlay {
			RoundedRectangle(cornerRadius: 8)
				.stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
				.foregroundStyle(Color(.systemGray4))
		}
	}
}


#Preview {
	MealCard(DevPreview.Meals.powerLunch)
}
