//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
	@State var vm: OnboardingViewModel = .init()
	@State var goalWeight: Double = 0
	var body: some View {
		Spacer()
		
		stepView(currentStep)
		
		BottomView(currentStep: currentStep,
				   backButtonAction: vm.previousStep,
				   nextButtonAction: vm.nextStep)
	}
	
	@ViewBuilder func stepView(_ currentStep: OnboardingStep) -> some View {
		switch currentStep {
			case .welcome:
				WelcomeView()
			case .intro:
				IntroView()
			case .units:
				EmptyView()
			case .goalLook:
				EditGoalView(goalWeight: $goalWeight)
		}
	}
}

extension OnboardingView {
	var currentStep: OnboardingStep {
		vm.step
	}
}

#Preview {
	OnboardingView()
}
