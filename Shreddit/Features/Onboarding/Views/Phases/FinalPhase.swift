//
//  FinalPhase.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

extension OnboardingContent {
	struct FinishView: View  {
		var body: some View {
			OnboardingStepView(title: "Let's get shredded!",
							   subheadline: "Lorem",
							   bodyText: "ipsum")
			{
				HighlightedTextView(highlight: .init(value: 44_000),
									content: .init(afterHighlight: "calories to burn until 10% body fat"))
			}
		}
	}
}
