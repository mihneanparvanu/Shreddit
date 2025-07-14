//
//  ProfileView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
		VStack {
			ProfilePicture(picture: "ProfilePicture", size: 120)
			
			Spacer()
		}
		
		
    }
}

#Preview {
    ProfileView()
}
