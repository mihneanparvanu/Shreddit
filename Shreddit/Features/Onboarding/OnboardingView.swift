//
//  OnboardingView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Dependencies

    let healthManager: HealthManager

    // MARK: Environment

    @Environment(\.scenePhase) var scenePhase

    // MARK: State

    @State var vm: OnboardingViewModel

    // MARK: Initializer

    init(onboardingManager: any OnboardingManager,
         settingsManager: any SettingsManager,
         healthManager: HealthManager)
    {
        vm = OnboardingViewModel(
            onboardingManager: onboardingManager,
            settingsManager: settingsManager
        )
        self.healthManager = healthManager
    }

    var body: some View {
        VStack {
			OnboardingContent(step: vm.currentStep)
			
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
        settingsManager: AppSettingsManager(), healthManager: HealthManager()
    )
}
