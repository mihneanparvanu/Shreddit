//
//  CaloriesInView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct CaloriesInView: View {
	//MARK: Dependencies
	let caloriesLeft: Int
	let protein: Macro
	let carbs: Macro
	let fat: Macro
	
	var body: some View {
		Text ("Calories in")
			.font(.title2)
		
		HighlightedTextView(
			highlight: .init(value: caloriesLeft),
			content: .init(beforeHighlight: "Have fun eating the rest",
						   afterHighlight: "kilocalories today.")
		)
		
		HStack (spacing: 20) {
			HighlightedTextView(
				highlight: .init(value: protein.currentValue),
				content: .init(afterHighlight: protein.title)
			)
			
			HighlightedTextView(
				highlight: .init(value: carbs.currentValue),
				content: .init(afterHighlight: carbs.title)
			)
			
			HighlightedTextView(
				highlight: .init(value: carbs.currentValue),
				content: .init(afterHighlight: carbs.title)
			)
		}
	}
}
#Preview {
    CaloriesInView()
}
