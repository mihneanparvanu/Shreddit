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

#Preview {
	ProfileView(user: User.preview)
}
