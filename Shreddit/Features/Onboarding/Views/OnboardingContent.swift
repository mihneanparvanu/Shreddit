//
//  OnboardingContent.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingContent: View {
	// MARK: Environment
	
	@Environment(AppSettingsManager.self) private var settingsManager
	@Environment(HealthManager.self) private var healthManager
	
	let step: OnboardingStep
	var body: some View {
		@Bindable var bindableSettingsManager = settingsManager
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
				UserDataView(settings: $bindableSettingsManager.settings)
			case .finish:
				FinishView()
		}
	}
}

