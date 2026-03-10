//
//  OnboardingLayout.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingStepView<Content: View>: View {

    let title: String
    let subheadline: String
    let bodyText: String
    let content: Content

	/// Layout with additional content
	init(
		title: String,
		subheadline: String,
		bodyText: String,
		@ViewBuilder content : () -> Content
	) {
		self.title = title
		self.subheadline = subheadline
		self.bodyText = bodyText
		self.content = content()
	}
	
	/// Layout without additional content
	init(
		title: String,
		subheadline: String,
		bodyText: String
	) where Content == EmptyView {
		self.title = title
		self.subheadline = subheadline
		self.bodyText = bodyText
		self.content = EmptyView()
	}

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle).fontWeight(.semibold)
        }
		.padding(.trailing, Design.space.l)
        .padding(.top, 36)

        Spacer()

        VStack {
			content

            VStack(alignment: .leading) {
                Text(subheadline)
                    .font(.title).fontWeight(.semibold)

                Text(bodyText)
            }
			.padding(.horizontal, 24)
        }

        Spacer()
    }
}

#Preview {
    OnboardingStepView(
        title: "Welcome to Shreddit",
        subheadline: "You’re getting shredded this summer ☀️",
        bodyText: "Get into the shape of your life. No BS, no burnout, just the exact calories left until you look insane."
    ) {
        Text("Test")
    }
}
