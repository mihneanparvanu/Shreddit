//
//  PreferencesManager.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

protocol PreferencesManager {
    associatedtype Preferences: Codable
    var preferences: Preferences { get set }
    var preferencesKey: String { get }

    func get()
}
