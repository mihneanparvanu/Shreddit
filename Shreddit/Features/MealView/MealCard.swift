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
			
			HStack (spacing: Design.space.xS){
				MacroCirclesView(meal.totalMacros)
				.macroStyle(size: .small, variant: .compact)
				
				
				Text(meal.foods.map(\.foodItem.name).joined(separator: ", "))
					.lineLimit(1)
					.minimumScaleFactor(0.9)
				Spacer()
				
			
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

private extension MealCard {
	var displayCalories: String {
		return units.convert(
			meal.calories
		).valueUnitDisplay
		}

}


#Preview {
	MealCard(DevPreview.Meals.powerLunch)
}
