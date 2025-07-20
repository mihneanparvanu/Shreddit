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
}


extension User {
	static let preview: User = .init(
		firstName: "Mihnea",
		lastName: "Parvanu",
		username: "m",
		email: nil,
		password: nil,
		image: "Preview/mProfileImage",
		createdAt: Date()
	)
}


#Preview {
	ProfileView(user: User.preview)
}
