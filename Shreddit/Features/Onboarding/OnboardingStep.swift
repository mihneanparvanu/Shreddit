//
//  OnboardingStep.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//


enum OnboardingStep: String, CaseIterable, Identifiable {
	var id: String { rawValue }
	case welcome, intro, units, goalLook
}
