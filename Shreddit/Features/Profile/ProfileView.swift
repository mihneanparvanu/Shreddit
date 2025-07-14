//
//  ProfileView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfileView: View {
	let picture: String
	let username: String
    var body: some View {
		VStack {
			ProfilePicture(picture: "ProfilePicture", size: 120)
			
			Text(username)
			
			
			Spacer()
		}
		
		
    }
}

#Preview {
	let picture = "ProfilePicture"
	let username = "m"
    ProfileView()
}
