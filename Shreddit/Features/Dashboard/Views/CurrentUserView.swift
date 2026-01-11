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
			case .detailed(let alignment):
				DetailedView(
					userImageURL: user.image,
					userName: user.username,
					alignment: alignment
				)
			case .imageOnly:
				ImageOnlyView(userImageURL: user.image ?? "")
		}
          
	}

    }
	
	enum Variant {
		case detailed(
			alignment: HorizontalAlignment = .trailing
		), compact, imageOnly
	}




private extension CurrentUserView {
	struct DetailedView: View {
		let userImageURL: String?
		let userName: String
		let alignment: HorizontalAlignment
		var body: some View {
			VStack (alignment: alignment){
				CompactView(userImageURL: userImageURL, userName: userName)
				
				HighlightedTextView(
					highlight: .init(value: 20),
					content: .init(afterHighlight: "days")
				)
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
		variant: .detailed(alignment: .leading)
	)
}
