//
//  Phase1.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

extension OnboardingContent {
	struct WelcomeView: View {		
		var body: some View {
			OnboardingStepView(title: "Welcome to Shreddit",
							 subheadline: "You’re getting shredded this summer ☀️",
							 bodyText: "Get into the shape of your life. No BS, no burnout, just the exact calories left until you look insane.")
			
		}
	}
	
	
	struct IntroView: View {
		var body: some View {
			OnboardingStepView(title: "The Philosophy",
							 subheadline: "Weight is a Liar. Fat is the Truth.",
							 bodyText: "Water, glycogen, and digestion make the scale bounce every day. Shreddit ignores the noise and focuses entirely on what matters: Body Fat Percentage and Lean Mass.")
		}
	}
	
}

#Preview {
	OnboardingContent.WelcomeView()
}
