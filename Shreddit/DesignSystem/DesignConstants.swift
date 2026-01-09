//
//  DesignConstants.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

enum DesignConstants {
    static let base: CGFloat = 4

    enum Sizing {
        static let xSmall: CGFloat = base * 3
        static let small: CGFloat = base * 4
        static let medium: CGFloat = base * 8
        static let mediumLarge: CGFloat = base * 10
        static let large: CGFloat = base * 16
        static let smallMultiplier: CGFloat = 1.1
        static let mediumMultiplier: CGFloat = 1.2
        static let largeMultiplier: CGFloat = 1.4
    }

    enum Padding {
        static let small = base * 2
        static let medium = base * 4
        static let large = base * 6
        static let extraLarge = base * 8
        static let extraExtraLarge = base * 16
    }

    enum Spacing {
        static let small = base
        static let medium = base * 4
        static let large = base * 6
        static let xlarge = base * 10
        static let xxLarge = base * 16
    }

    enum CornerRadius {
        static let small: CGFloat = base * 2
        static let medium: CGFloat = base * 4
        static let large: CGFloat = base * 8
    }

    enum Colors {
        enum Brand {
            static let primary = Color(.Colors.appPrimary)
            static let secondary = Color(.Colors.appSecondary)
        }

        enum Surface {
            static let primary = Color(.Colors.surfacePrimary)
            static let secondary = Color(.Colors.surfaceSecondary)
            static let tertiary = Color(.Colors.surfaceTertiary)
        }

        enum Content {
            static let primary = Color(.Colors.contentPrimary)
            static let secondary = Color(.Colors.contentSecondary)
            static let tertiary = Color(.Colors.contentTertiary)
        }
    }
}
