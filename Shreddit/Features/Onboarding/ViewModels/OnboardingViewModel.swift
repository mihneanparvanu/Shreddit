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
	//MARK: Properties
	
	// Dependencies
	var settingsManager: SettingsManager
	var onboardingManager: OnboardingManager
	
	// Onboarding State
	var currentStep: OnboardingStep {
		get {
			onboardingManager.state.currentStep
		}
		set {
			onboardingManager.state.currentStep = newValue
		}
	}
	
	// Settings
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
	
	//MARK: Initializer
	
	init(onboardingManager: OnboardingManager,
		settingsManager: SettingsManager
	){
		self.onboardingManager = onboardingManager
		self.settingsManager = settingsManager
	}
	
	//MARK: Methods
	
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
	
	func finishOnboarding () {
		onboardingManager.state.hasOnboarded = true
	}
}
