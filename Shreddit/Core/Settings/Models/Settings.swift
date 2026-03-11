//
//  Settings.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

typealias Appearance = Settings.Appearance

struct Settings: Codable, Sendable {
    var appearance: Appearance = .system
    var units: Units

	enum Appearance: CaseIterable, Identifiable, Codable, Sendable {
        case light
        case dark
        case system

        var id: Self { self }

        var title: String {
            switch self {
            case .light:
                return "Light"
            case .dark:
                return "Dark"
            case .system:
                return "System"
            }
        }

        var colorScheme: ColorScheme? {
            switch self {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }
    }
}
