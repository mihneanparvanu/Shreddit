//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
	@State var vm: OnboardingViewModel
	
	init(onboardingManager: any OnboardingManager,
		settingsManager: any SettingsManager){
		self.vm = OnboardingViewModel(
			onboardingManager: onboardingManager,
			settingsManager: settingsManager
		)
	}
	
	var body: some View {
		VStack {
			Spacer()
			
			stepView(vm.currentStep)
			
			BottomView(currentStep: vm.currentStep,
					   backButtonAction: {vm.goToPreviousStep()},
					   nextButtonAction: {vm.goToNextStep()})
		}
		.infinityFrame()
		.background()
		.onAppear{
			vm.resetOnboardingIfNeeded(after: .days(0.5))
		}
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
				EditGoalView()
			case .start:
				EmptyView()
		}
	}
}


#Preview {
	OnboardingView(
		onboardingManager: AppOnboardingManager(),
		settingsManager: AppSettingsManager()
	)
}
