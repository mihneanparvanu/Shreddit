//
//  OnboardingLayout.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingLayout<Content: View>: View {
	@Environment(\.designSystem) var design
	 
	let title: String
	let subheadline: String
	let bodyText: String
	@ViewBuilder let content: Content?
	
    var body: some View {
		VStack {
			Text(title)
				.font(.largeTitle).fontWeight(.semibold)
		}
		.padding(.trailing, 64)
		.padding(.top, 36)
		
		Spacer()
		
		VStack {
			content
			
			VStack (alignment: .leading){
				Text(subheadline)
					.font(.title2).fontWeight(.semibold)
				
				Text(bodyText)
			}
		}
		
		
		Spacer()
		
    }
}

#Preview {
	OnboardingLayout(title: "Welcome to Shreddit",
					 subheadline: "You’re getting shredded this summer ☀️",
					 bodyText: "Get into the shape of your life. No BS, no burnout, just the exact calories left until you look insane.") {
		Text ("Test")
	}
}
