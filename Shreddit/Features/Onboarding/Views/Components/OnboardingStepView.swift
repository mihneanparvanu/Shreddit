//
//  OnboardingLayout.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

struct OnboardingStepView<Content: View>: View {

    let title: String
	let subheadline: String?
    let bodyText: String?
    let content: Content

	/// Layout with additional content
	init(
		title: String,
		subheadline: String? = nil,
		bodyText: String? = nil,
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
		subheadline: String? = nil,
		bodyText: String? = nil
	) where Content == EmptyView {
		self.title = title
		self.subheadline = subheadline
		self.bodyText = bodyText
		self.content = EmptyView()
	}

    var body: some View {
		HStack  {
            Text(title)
                .font(.largeTitle).fontWeight(.semibold)
			
			Spacer()
        }
		.padding(.leading, Design.space.s)
		.padding(.top, Design.space.m)

        Spacer()

        VStack {
			content

            VStack(alignment: .leading) {
				if let subheadline {
					Text(subheadline)
						.font(.title).fontWeight(.semibold)
				}
              

				if let bodyText {
					Text(bodyText)
				}
            }
			.padding(.horizontal, 24)
        }

        Spacer()
    }
}

#Preview {
	
}
