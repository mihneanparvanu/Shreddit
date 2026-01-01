//
//  CurrentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct CurrentView: View {
	//MARK: Dependencies
	let userImage: String?
	
    var body: some View {
		HStack {
			Text(Date().formatted(.dateTime.month(.abbreviated).day()))
			
			ProfilePicture(picture: userImage,
						   size: 24)
		}
		.padding(.trailing)
    }
}

#Preview {
	CurrentView(userImage: User.preview.image)
}
