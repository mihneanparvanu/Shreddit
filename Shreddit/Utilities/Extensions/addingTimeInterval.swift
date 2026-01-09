//
//  addingTimeInterval.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 12.07.2025.
//

import Foundation

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
