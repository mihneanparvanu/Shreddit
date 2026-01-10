//
//  ProfileForm.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/10/26.
//

import SwiftUI

struct ProfileSectionView<Content: View>: View {
	let title: String
	let link: Link<Content>
	
	var body: some View {
		Section(title) {
			NavigationLink(link.label) {
				link.destination()
			}
		}
	}
}

extension ProfileSectionView {
	struct Link<Destination: View> {
		let label: String
		@ViewBuilder let destination: () -> Destination
	}
}

#Preview {

}
