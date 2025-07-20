//
//  FocusView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct FocusView: View {
	
	@Environment(\.designSystem) var design
    var body: some View {
		Text("Calories in")
			.font(.largeTitle.weight(.semibold))
			.foregroundStyle(design.colors.content.heading)
		
		Text("Total energy consumed with macros")
			.font(.callout)
			.foregroundStyle(design.colors.content.description)
		
		
    }
}

#Preview {
    FocusView()
}
