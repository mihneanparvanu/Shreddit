//
//  OnboardingViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import Observation
import SwiftUI

@MainActor
@Observable
final class OnboardingViewModel {
    // MARK: Properties

    // Dependencies
    var settingsManager: any SettingsManager
    var onboardingManager: any OnboardingManager

    // Onboarding State
    var currentStep: OnboardingStep {
        get {
            onboardingManager.state.currentStep
        }
        set {
            onboardingManager.state.currentStep = newValue
            onboardingManager.state.lastSetTime = Date()
        }
    }

    // Settings
	var settings: Settings {
        get {
            settingsManager.settings
        }
        set {
            settingsManager.settings = newValue
        }
    }

    // MARK: Initializer

    init(onboardingManager: any OnboardingManager,
         settingsManager: any SettingsManager)
    {
        self.onboardingManager = onboardingManager
        self.settingsManager = settingsManager
    }

    // MARK: Methods

    func goToNextStep() {
        if currentStep.next == currentStep {
            finishOnboarding()
        } else {
            currentStep = currentStep.next
        }
    }

    func goToPreviousStep() {
        currentStep = currentStep.previous
    }

    func finishOnboarding() {
        onboardingManager.state.hasOnboarded = true
    }

    func resetOnboardingIfNeeded(after interval: TimeUnit = .days(0.5)) {
        let lastSetTime = onboardingManager.state.lastSetTime

        if lastSetTime.timeIntervalSinceNow < -interval.inSeconds {
            onboardingManager.state.currentStep = .welcome
        }
    }
}
