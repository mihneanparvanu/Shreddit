//
//  User+Preview.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/9/26.
//

import Foundation

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
				startWeight: 70,
				currentAvgWeight: 61.5,
				goalWeight: 56.25,
				difficulty: .custom(.init(1.0)!),
				activeLedger: 0,
				tdeePenalty: 0
			),
		metabolsim: .init(tdeeCalories: 2600,
						  intakeCalories: 2000)
	)
}


