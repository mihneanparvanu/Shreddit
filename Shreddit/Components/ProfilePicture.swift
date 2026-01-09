//
//  ProfilePicture.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfilePicture: View {
    let picture: String?
    let size: CGFloat
    var body: some View {
        if let picture {
            Image(picture)
                .resizable()
                .scaledToFit()
                .frame(size: size)
                .clipShape(Circle())
        } else {
            Circle()
                .foregroundStyle(.gray)
                .frame(size: size)
        }
    }
}

#Preview {
    let picture = "ProfilePicture"
    ProfilePicture(picture: picture,
                   size: 100)
}
