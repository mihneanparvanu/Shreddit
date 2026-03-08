//
//  OnboardingContent.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingContent: View {
	let step: OnboardingStep
	@Binding var settings: Settings
	let healthManager: HealthManager
	var body: some View {
		switch step {
			case .welcome:
				WelcomeView()
			case .intro:
				IntroView()
			case .goalLook:
				GoalLookView()
			case .dietPace:
				DietPaceView()
			case .userData:
				UserDataView(settings: $settings, healthManager: healthManager)
			case .finish:
				FinishView()
		}
	}
}

