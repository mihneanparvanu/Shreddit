//
//  OnboardingState.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

struct OnboardingState: Codable {
	var hasOnboarded: Bool = false
	var currentStep: OnboardingStep = .welcome
}
