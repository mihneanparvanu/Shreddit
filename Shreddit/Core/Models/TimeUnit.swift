//
//  TimeUnit.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

enum TimeUnit {
    case hours(Double)
    case days(Double)

    var inSeconds: Double {
        let secondsInHour: Double = 60 * 60
        let secondsInDay: Double = secondsInHour * 24
        switch self {
        case let .hours(hours):
            return hours * secondsInHour
        case let .days(days):
            return days * secondsInDay
        }
    }
}
