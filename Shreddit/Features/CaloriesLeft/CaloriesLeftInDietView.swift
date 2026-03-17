//
//  CaloriesLeftInDietView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/16/26.
//

import SwiftUI

struct CaloriesLeftInDietView: View {
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
	CaloriesLeftInDietView(averageWeight: 61.5,
						   goalWeight: 56.25)
}
