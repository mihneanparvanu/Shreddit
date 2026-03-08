//
//  OnboardingContent.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingContent: View {
	let step: OnboardingStep
	var body: some View {
		switch currentStep {
			case .welcome:
				WelcomeView()
			case .intro:
				IntroView()
			case .preferences:
				PreferencesView(appearance: $vm.appearance,
										  selectedUnits: $vm.units)
			case .setGoal:
				EditGoalView()
			case .dataRequest:
				DataRequestView(healthManager: healthManager)
		}
	}
}



#Preview {
    OnboardingContent()
}
