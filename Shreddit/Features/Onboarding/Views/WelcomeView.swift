//
//  WelcomeView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

extension OnboardingView {
	struct WelcomeView: View {
		var body: some View {
			VStack {
				Image(systemName: "scissors")
				
				Text ("Welcome to Shreddit!")
					.font(.title)
				
				Text("This app will get you shredded!")
				
				Text("(scientifically and sustainably)")
					.font(.footnote)
			}
			
		}
	}
}


#Preview {
	OnboardingView.WelcomeView()
}
