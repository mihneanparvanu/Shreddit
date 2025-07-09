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
	var settingsManager: SettingsManager
	var onboarding: OnboardingManager
	
	init(onboarding: OnboardingManager,
		settingsManager: SettingsManager
	){
		self.onboarding = onboarding
		self.settingsManager = settingsManager
	}
	
	var currentStep: OnboardingStep {
		get {
			onboarding.state.currentStep
		}
		set {
			onboarding.state.currentStep = newValue
		}
	}
	
	func goToNextStep () {
		if currentStep.next == currentStep {
			finishOnboarding()
		} else {
			currentStep = currentStep.next
		}
	}
	
	func goToPreviousStep () {
		currentStep = currentStep.previous
	}
	
	//Settings
	var appearance: Appearance {
		get {
			settingsManager.settings.appearance
		}
		set {
			settingsManager.settings.appearance = newValue
		}
	}
	
	var units: Units {
		get {
			settingsManager.settings.units
		}
		set {
			settingsManager.settings.units = newValue
		}
	}
	
	func finishOnboarding () {
		onboarding.state.hasOnboarded = true
	}
}
