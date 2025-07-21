//
//  User.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct User: Codable, Identifiable {
	var id: String { username }
	let firstName: String?
	let lastName: String?
	let username: String
	let email: String?
	let password: String?
	let image: String?
	let createdAt: Date
	let currentDiet: Diet?
}

extension User {
	static let preview: User = .init(
		firstName: "Mihnea",
		lastName: "Parvanu",
		username: "m",
		email: nil,
		password: nil,
		image: "Preview/mProfileImage",
		createdAt: Date(),
		currentDiet: .init(
			startDate: .distantPast,
			endDate: .distantPast,
			startWeight: 153,
			endWeight: 153,
			difficulty: .preset(preset: .hard),
			currentDeficit: 600,
		)
	)
}


#Preview {
	ProfileView(user: User.preview)
}
