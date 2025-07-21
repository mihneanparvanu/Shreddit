//
//  CaloriesInView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct CaloriesInView: View {
	//MARK: Environment
	@Environment(\.designSystem) var design
	
    var body: some View {
		VStack{
			Text("Calories in")
				.font(.largeTitle.weight(.semibold))
				.foregroundStyle(design.colors.content.heading)
			
			Text("Total energy consumed with macros")
				.font(.callout)
				.foregroundStyle(design.colors.content.description)
			
			Spacer()
			
			Text ("3000 calories today")
				.font(.largeTitle.weight(.semibold))
				.foregroundStyle(design.colors.accent.primary)
			
			
			Text ("600 calories deficit")
				.font(.caption)
				.padding()
				.background(design.colors.surface.secondary)
				.clipShape(.capsule)
			
			Spacer()
		}
    }
}

#Preview {
    CaloriesInView()
}
