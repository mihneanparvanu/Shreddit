//
//  DesignSystem.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI


struct DesignSystem {
	
	static let defaultDesign = DesignSystem(
		colors: .init(
			content: .init(primary: DesignConstants.Colors.Content.primary)
		)
	)
	
	let colors: Colors
	
	
	struct Text {
	}
	
	struct Colors {
		let content: Content
		struct Content {
			let primary: Color
		}
	}
	
	struct Spacing {
	}
	
	struct Padding {
	}
	
	struct Size {
	}
}

private struct DesignSystemKey: EnvironmentKey {
	static let defaultValue: DesignSystem = .defaultDesign
}

extension EnvironmentValues {
	var designSystem: DesignSystem {
		get { self[DesignSystemKey.self] }
		set { self[DesignSystemKey.self] = newValue }
	}
}
