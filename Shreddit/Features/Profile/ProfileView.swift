//
//  ProfileView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfileView: View {
	//MARK: Dependencies
	let user: User
	
    var body: some View {
		VStack {
			ProfilePicture(picture: user.image, size: 120)
				.profilePictureBorder(
					color: DesignConstants.Colors.Brand.primary
				)
			
			Text(user.username)
				.font(.subheadline)
				.foregroundStyle(.gray)
			
			Spacer()
		}
    }
}

#Preview {
	let user = User.preview
	ProfileView(user: user)
}
