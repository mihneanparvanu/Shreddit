//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
	@State var goalWeight: Double = 0
	@State var currentStep: OnboardingStep = .welcome
    var body: some View {
		Spacer()
		
		step(currentStep)
		
		Spacer()
		
		HStack{
			ForEach (OnboardingStep.allCases) { step in
				Button {
					currentStep = step
				} label:
				{
					Circle()
						.fill(	step == currentStep ? Color.accentColor : Color.gray)
						.frame(size: Constants.Sizing.xSmall)
				}
			}
		}
    }
	
	@ViewBuilder func step(_ currentStep: OnboardingStep) -> some View {
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

#Preview {
    OnboardingView()
}
