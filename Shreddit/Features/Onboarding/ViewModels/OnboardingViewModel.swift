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
	var stepIndex = 0
	let stepsArray = OnboardingStep.allCases
	
	var step: OnboardingStep {
		stepsArray[stepIndex]
	}
	
	func nextStep() {
		if stepIndex < stepsArray.count - 1  {
			stepIndex += 1
		}
	}
	
	func previousStep() {
		if stepIndex > 0  {
			stepIndex -= 1
		}
	}
}
