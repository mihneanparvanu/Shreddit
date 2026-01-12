//
//  CurrentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct CurrentUserView: View {
	// MARK: Dependencies

	let user: User
	let variant: Variant

	var body: some View {
		switch variant {
			case .compact:
				CompactView(userImageURL: user.image, userName: user.username)
			case .detailed(let alignment, let details):
				DetailedView(
					userImageURL: user.image,
					userName: user.username,
					details: details,
					alignment: alignment
				)
			case .imageOnly:
				ImageOnlyView(userImageURL: user.image ?? "")
		}
	}
}

enum Variant {
	case detailed(
		alignment: HorizontalAlignment = .trailing,
		details: (highlight:
			HighlightedTextView.Highlight?,
			content:
			HighlightedTextView.Content?)
	), compact, imageOnly
}

private extension CurrentUserView {
	struct DetailedView: View {
		let userImageURL: String?
		let userName: String
		let details: (highlight: HighlightedTextView.Highlight?, content: HighlightedTextView.Content?)
		let alignment: HorizontalAlignment
		var body: some View {
			VStack(alignment: alignment) {
				CompactView(userImageURL: userImageURL, userName: userName)

				if let highlight = details.highlight, let content = details.content {
					HighlightedTextView(
						highlight: highlight,
						content: content
					)
				}
			}
		}
	}

	struct CompactView: View {
		let userImageURL: String?
		let userName: String

		var body: some View {
			HStack {
				ProfilePicture(picture: userImageURL,
				               size: 24)

				Text(userName)
			}
		}
	}

	struct ImageOnlyView: View {
		let userImageURL: String?

		var body: some View {
			ProfilePicture(picture: userImageURL,
			               size: 24)
		}
	}
}

#Preview {
	CurrentUserView(
		user: User.preview,
		variant:
		.detailed(
			details: (
				highlight: .init(value: 20),
				content: .init(afterHighlight: "days")
			)
		)
	)
}
