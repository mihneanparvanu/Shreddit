//
//  BottomView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

extension OnboardingView {
    struct BottomView: View {
        let currentStep: OnboardingStep
        let backButtonAction: () -> Void
        let nextButtonAction: () -> Void
		
		@Environment(\.theme) var theme
				
        var body: some View {
			VStack (spacing: Design.space.m) {
                buttons

                stepIndicator
            }
        }

        var buttons: some View {
			HStack(spacing: Design.space.s) {
                if shouldShowBackButton {
                    Button {
                        backButtonAction()
                    } label: {
                        Text("Back")
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color(.systemGray6))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }

                Button {
                    nextButtonAction()
                } label: {
                    Text("Continue")
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }

        var stepIndicator: some View {
            HStack {
                ForEach(OnboardingStep.allCases) { step in
                    Circle()
						.fill(
							step == currentStep ? theme.colors.content.secondary : theme.colors.content.tertiary)
						.frame(size: Design.size.xS)
                }
            }
        }
    }
}

extension OnboardingView.BottomView {
    var shouldShowBackButton: Bool {
        currentStep != .welcome
    }
}

#Preview {
    OnboardingView
        .BottomView(currentStep: .intro,
                    backButtonAction: {},
					nextButtonAction: {})
}
