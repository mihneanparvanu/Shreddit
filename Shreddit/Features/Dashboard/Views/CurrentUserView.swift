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
			case .detailed(let details):
				DetailedView(
					userImageURL: user.image,
					userName: user.username,
					details: details)
			case .imageOnly:
				ImageOnlyView(userImageURL: user.image ?? "")
		}
	}
}

enum Variant {
	case detailed(
		details: CurrentUserView.UserDetails
	), compact, imageOnly
}

extension CurrentUserView {
	struct UserDetails {
		let highlight: HighlightedTextView.Highlight?
		let content: HighlightedTextView.Content?
	}
}

private extension CurrentUserView {
	
	struct DetailedView: View {
		let userImageURL: String?
		let userName: String
		let details: UserDetails
		var body: some View {
			HStack {
				

				if let highlight = details.highlight, let content = details.content {
					HighlightedTextView(
						highlight: highlight,
						content: content
					)
				}
				
				CompactView(userImageURL: userImageURL, userName: userName)
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
					details: .init(
						highlight: .init(value: 20),
						content: .init(afterHighlight: "days")
					)
				)
	)
}
