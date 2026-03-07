//
//  fromDate.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 1/12/26.
//

import Foundation

extension Date {
	static func from(year: Int, month: Int, day: Int) -> Date {
		let components = DateComponents (year: year, month: month, day: day)
		return Calendar.current.date(from: components) ?? Date()
	}
}
