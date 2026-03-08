//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Dependencies

    // MARK: State

    @State var vm: OnboardingViewModel

    // MARK: Initializer

    init(onboardingManager: any OnboardingManager)
    {
        vm = OnboardingViewModel(
            onboardingManager: onboardingManager
        )
    }

    var body: some View {
        VStack {
			OnboardingContent(step: vm.currentStep)
			
			Spacer()
			
            BottomView(currentStep: vm.currentStep,
                       backButtonAction: { vm.goToPreviousStep() },
                       nextButtonAction: { vm.goToNextStep() })
        }
        .infinityFrame()
        .background()
        .onViewReady {
            vm.resetOnboardingIfNeeded(after: Config.Onboarding.resetInterval)
        }
    }
}

#Preview {
	OnboardingView(
		onboardingManager: AppOnboardingManager(),
)
	.previewEnvironment()
}
