//
//  Diet.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 13.07.2025.
//

import Foundation

struct Diet: Identifiable, Codable {
    var id: String { "Diet \(startDate) - \(endDate)" }
    let startDate: Date
    let endDate: Date
    let startWeight: Double
    let currentWeight: Double
    let goalWeight: Double
    let difficulty: Difficulty

    enum Difficulty: Codable {
        case preset(Preset)
        case custom(lossRate: Double)

        var weeklyLossRatePercentage: Double {
            switch self {
            case let .preset(preset):
                switch preset {
                case .easy:
                    return 0.5
                case .medium:
                    return 0.7
                case .hard:
                    return 0.9
                }

            case let .custom(lossRate):
                return lossRate
            }
        }
    }

    enum Preset: String, CaseIterable, Codable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
}
