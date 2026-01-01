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
			Spacer()
			
			Image(systemName: "scissors")
			
			VStack (alignment: .leading) {
				Text ("You're getting shredded!")
					.font(.largeTitle).fontWeight(.semibold)
				
				Text("This app will get you in the shape of your life by using industry disrupting calories-left-to-burn, overview of diet, activity levels and more!")
					.foregroundStyle(.gray)
			}
		}
	}
}


#Preview {
	OnboardingView.WelcomeView()
}
