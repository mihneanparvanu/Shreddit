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
            "I'm all good"
        case .minFatigue:
            "I'm a bit hungry"
        case .mildFatigue:
            "I'm hungry and tired"
        case .highFatigue:
            "I feel like every day is a chore."
        case .extremeFatigue:
            "I'd rather die than do this anymore!"
        }
    }

    var emoji: String {
        switch self {
        case .noFatigue:
            "😄"
        case .minFatigue:
            "😅"
        case .mildFatigue:
            "😬"
        case .highFatigue:
            "😣"
        case .extremeFatigue:
            "😫"
        }
    }
}
