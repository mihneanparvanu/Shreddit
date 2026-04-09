//
//  CurrentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct UserView: View {
	// MARK: Dependencies

	let user: User

	@Environment(\.userViewVariant) var variant
	
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


extension UserView {
	enum Variant {
		case detailed(
			details: UserView.UserDetails
		), compact, imageOnly
	}
	
	struct UserDetails {
		let highlight: HighlightedTextView.Highlight?
		let content: HighlightedTextView.Content?
	}
}

private extension UserView {
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
					.foregroundStyle(.secondary)
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
	UserView(
		user: DevPreview.Users.main)
}
