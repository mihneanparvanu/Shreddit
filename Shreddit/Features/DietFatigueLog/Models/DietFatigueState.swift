//
//  DietFatigueState.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/31/25.
//

enum DietFatigueState: CaseIterable, Identifiable {
    case noFatigue
    case minFatigue
    case mildFatigue
    case highFatigue
    case extremeFatigue

    var id: Self {
        self
    }

    var index: Int {
        Self.allCases.firstIndex(of: self)!
    }

    var description: String {
        switch self {
        case .noFatigue:
            return "I'm all good"
        case .minFatigue:
            return "I'm a bit hungry"
        case .mildFatigue:
            return "I'm hungry and tired"
        case .highFatigue:
            return "I feel like every day is a chore."
        case .extremeFatigue:
            return "I'd rather die than do this anymore!"
        }
    }

    var emoji: String {
        switch self {
        case .noFatigue:
            return "😄"
        case .minFatigue:
            return "😅"
        case .mildFatigue:
            return "😬"
        case .highFatigue:
            return "😣"
        case .extremeFatigue:
            return "😫"
        }
    }
}
