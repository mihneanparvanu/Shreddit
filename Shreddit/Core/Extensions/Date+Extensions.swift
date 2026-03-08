//
//  DateExtensions.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/9/26.
//


import Foundation


extension Date {
	var startOfDay: Date {
		Calendar.current.startOfDay(for: self)
	}
}

extension Date {
	static func from(year: Int, month: Int, day: Int) -> Date {
		let components = DateComponents (year: year, month: month, day: day)
		return Calendar.current.date(from: components) ?? Date()
	}
}

extension Date {
	func addingTimeInterval(days: Double) -> Date {
		let secondsInHour: Double = 60 * 60
		let secondsInDay: Double = secondsInHour * 24
		return addingTimeInterval(secondsInDay * days)
	}
}

extension Date {
	func addingTimeInterval(hours: Double) -> Date {
		let secondsInHour: Double = 60 * 60
		return addingTimeInterval(secondsInHour * hours)
	}
}
