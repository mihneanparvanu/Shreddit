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
        var body: some View {
            VStack {
                buttons

                stepIndicator
            }
        }

        var buttons: some View {
            HStack(spacing: DesignConstants.Spacing.medium) {
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
                        .fill(step == currentStep ? Color.accentColor : Color.gray)
                        .frame(size: DesignConstants.Sizing.xSmall)
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
                    nextButtonAction: {}).buttons
}
