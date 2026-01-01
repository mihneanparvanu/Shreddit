//
//  startOfDay.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import Foundation

extension Date {
	var startOfDay: Date {
		Calendar.current.startOfDay(for: self)
	}
}
