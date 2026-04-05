//
//  DBFood.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftData
import Foundation

@Model
final class DBFood {
	@Attribute(.unique) var id: String
	var name: String
	var photo: String?
	var macros: [Macro]
	var isSystemProvided: Bool
	
	init(id: String, name: String, photo: String?, macros: [Macro], isSystemProvided: Bool) {
		let safeID = name.lowercased().split(separator: " ").joined(separator: "_")
		self.id = isSystemProvided ? "sys_\(safeID)" : UUID().uuidString
		
		self.name = name
		self.photo = photo
		self.macros = macros
		self.isSystemProvided = isSystemProvided
	}
}
