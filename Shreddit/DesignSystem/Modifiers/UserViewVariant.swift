//
//  UserViewVariant.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/9/26.
//

import SwiftUI

private struct UserViewVariant: EnvironmentKey {
    static let defaultValue: UserView.Variant = .compact
}

extension EnvironmentValues {
    var userViewVariant: UserView.Variant {
        get {
            self[UserViewVariant.self]
        }
        set {
            self[UserViewVariant.self] = newValue
        }
    }
}

struct UserViewVariantModifier: ViewModifier {
    let variant: UserView.Variant?

    @Environment(\.userViewVariant) var envVariant

    func body(content: Content) -> some View {
        var newVariant = envVariant

        if let variant { newVariant = variant }

        return content.environment(\.userViewVariant, newVariant)
    }
}

extension View {
    func userViewVariant(_ variant: UserView.Variant) -> some View {
        modifier(UserViewVariantModifier(variant: variant))
    }
}
