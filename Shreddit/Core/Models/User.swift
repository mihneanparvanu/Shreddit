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
	var settings: Settings?
	var currentDiet: Diet?
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
		settings: nil,
		currentDiet: .init(
			startDate: Date.from(year: 2026, month: 1, day: 1),
			endDate: .distantFuture,
			startWeight: 153.0,
			currentWeight: 136.0,
			goalWeight: 124.0,
			difficulty: .preset(.hard)
		)
	)
}

#Preview {
	ProfileView(user: User.preview)
}
