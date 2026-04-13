//
//  DBFood.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import Foundation
import SwiftData

@Model
final class DBFood {
    @Attribute(.unique) var id: String? = nil
    var name: String
    var photo: String?
    var isSystemProvided: Bool

    var rawProtein: Double
    var rawCarbs: Double
    var rawFats: Double
    var rawFiber: Double = 0
    var rawSugar: Double = 0

    init(
        id _: String,
        name: String,
        photo: String?,
        isSystemProvided: Bool,
        p: Double,
        c: Double,
        f: Double,
        fiber: Double = 0,
        sugar: Double = 0
    ) {
        let safeID = name.lowercased().split(separator: " ").joined(separator: "_")
        id = isSystemProvided ? "sys_\(safeID)" : UUID().uuidString

        self.name = name
        self.photo = photo
        self.isSystemProvided = isSystemProvided
        rawProtein = p
        rawCarbs = c
        rawFats = f
        rawFiber = fiber
        rawSugar = sugar
    }
}

extension DBFood {
    @MainActor
    @Transient var macros: [Macro] {
        [Macro(kind: .protein, massValue: rawProtein),
         Macro(
             massValue: rawCarbs,
             fiberValue: rawFiber,
             sugarValue: rawSugar
         ),
         Macro(kind: .fats, massValue: rawFats)]
    }
}
