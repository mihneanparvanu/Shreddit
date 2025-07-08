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
	var currentStep: OnboardingStep = .welcome
	
	func goToNextStep () {
		currentStep = currentStep.next
	}
	
	func goToPreviousStep () {
		currentStep = currentStep.previous
	}
}
