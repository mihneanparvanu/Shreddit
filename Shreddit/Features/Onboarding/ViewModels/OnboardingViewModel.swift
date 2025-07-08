//
//  OnboardingViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import Observation
import SwiftUI
typealias Units = Settings.Units

@MainActor
@Observable
final class OnboardingViewModel {
	var settingsManager: SettingsManager
	
	init(settingsManager: SettingsManager){
		self.settingsManager = settingsManager
	}
	
	var currentStep: OnboardingStep = .welcome
	
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
	var units: Units {
		get {
			settingsManager.settings.units
		}
		set {
			settingsManager.settings.units = newValue
		}
	}
	
	func finishOnboarding () {
		settingsManager.settings.hasOnboarded = true
	}
}
