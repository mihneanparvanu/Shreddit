//
//  Settings.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

typealias Appearance = Settings.Appearance

struct Settings: Codable {
    var appearance: Appearance = .system
    var units: Units

    enum Appearance: CaseIterable, Identifiable, Codable {
        case light
        case dark
        case system

        var id: Self {
            self
        }

        var title: String {
            switch self {
            case .light:
                "Light"
            case .dark:
                "Dark"
            case .system:
                "System"
            }
        }

        var colorScheme: ColorScheme? {
            switch self {
            case .light:
                .light
            case .dark:
                .dark
            case .system:
                nil
            }
        }
    }
}
