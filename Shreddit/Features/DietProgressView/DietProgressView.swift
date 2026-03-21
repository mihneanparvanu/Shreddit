//
//  CaloriesLeftInDietView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/16/26.
//

import SwiftUI

struct DietProgressView: View {
	//MARK: Dependencies
	let diet: Diet
	
	//MARK: State
	@State private var vm: DietProgressViewModel
	
	init(_ diet: Diet) {
		self.diet = diet
		self.vm = .init(diet: diet)
	}
	
	var body: some View {
			HighlightedTextView(
				highlight: .init(value: diet.trueRemainingDeficit),

				content: .init(afterHighlight: "calories left until goal body fat")
			)
		}
}
 

#Preview {
	let diet = User.preview.currentDiet!
	DietProgressView(diet)
}

