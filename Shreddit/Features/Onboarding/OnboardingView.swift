//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
	@State var vm: OnboardingViewModel
	@State var goalWeight: Double = 0
	
	init(settingsManager: SettingsManager){
		self.vm = OnboardingViewModel(settingsManager: settingsManager)
	}
	
	var body: some View {
		VStack {
			Spacer()
			
			stepView(vm.currentStep)
			
			BottomView(currentStep: vm.currentStep,
					   backButtonAction: {vm.goToPreviousStep()},
					   nextButtonAction: {vm.goToNextStep()})
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background()
	}
	
	@ViewBuilder func stepView(_ currentStep: OnboardingStep) -> some View {
		switch currentStep {
			case .welcome:
				WelcomeView()
			case .intro:
				IntroView()
			case .units:
				OnboardingPreferencesView(appearance: $vm.appearance,
										  selectedUnits: $vm.units)
			case .setGoal:
				EditGoalView(goalWeight: $goalWeight)
			case .start:
				EmptyView()
		}
	}
}


#Preview {
	OnboardingView(settingsManager: SettingsManager())
}
