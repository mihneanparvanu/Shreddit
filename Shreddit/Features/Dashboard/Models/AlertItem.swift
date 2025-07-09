//
//  AlertItem.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
	let id = UUID()
	let title: String
	let message: String
	let dismiss: Alert.Button = .default(Text("OK"))
}
