//
//  CaloriesLeftInDietView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/16/26.
//

import SwiftUI

struct DietProgressView: View {
	let averageWeight: Double
	let goalWeight: Double
	var body: some View {
		let caloriesLeft = PhysiologyEngine.calculateRemainingDeficit(
			weight: averageWeight,
			goalWeight: goalWeight
		)
		
		HighlightedTextView(
			highlight: .init(value: caloriesLeft),
			content: .init(afterHighlight: "calories left until goal body fat")
		)
	}
}
 

#Preview {
	let m = User.preview
	DietProgressView(averageWeight: m.currentDiet?.currentAvgWeight ?? 0,
						   goalWeight: m.currentDiet?.goalWeight ?? 0)
}
