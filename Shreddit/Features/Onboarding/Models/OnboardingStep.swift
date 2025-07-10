//
//  OnboardingStep.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//


enum OnboardingStep: String, CaseIterable, Identifiable, Codable {
	case welcome
	case intro
	case preferences
	case dataRequest
	case additionalData
	case setGoal
	case start
	
	var id: String { rawValue }
}

//MARK: Iteration logic
extension OnboardingStep {
	var next: OnboardingStep {
		let allCases = Self.allCases
		guard let index = allCases.firstIndex(of: self) else {
			return self
		}
		
		if index < allCases.count - 1 {
			return allCases[index + 1]
		}
		
		return self
	}
	
	var previous: OnboardingStep {
		let allCases = Self.allCases
		guard let index = allCases.firstIndex(of: self) else {
			return self
		}
		
		if index > 0 {
			return allCases[index - 1]
		}
		
		return self
	}
}

