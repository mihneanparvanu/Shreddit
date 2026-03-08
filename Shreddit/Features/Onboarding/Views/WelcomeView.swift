//
//  WelcomeView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI


extension OnboardingView {
	struct WelcomeView: View {
		@Environment(\.designSystem) var design
		
		var body: some View {
			OnboardingLayout(title: "Welcome to Shreddit",
							 subheadline: "You’re getting shredded this summer ☀️",
							 bodyText: "Get into the shape of your life. No BS, no burnout, just the exact calories left until you look insane.")
			
		}
	}
}

#Preview {
    OnboardingView.WelcomeView()
}
