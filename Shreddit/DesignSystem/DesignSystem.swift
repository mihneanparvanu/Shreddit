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
			accent: .init(primary: DesignConstants.Colors.Brand.primary,
						  secondary: DesignConstants.Colors.Brand.secondary),
			surface: .init(base: DesignConstants.Colors.Surface.primary,
						   secondary: DesignConstants.Colors.Surface.secondary,
						   tertiary: DesignConstants.Colors.Surface.tertiary),
			content: .init(heading: DesignConstants.Colors.Content.primary,
						   subheading: DesignConstants.Colors.Content.secondary,
						   description: DesignConstants.Colors.Content.tertiary
						  )
		))
		
		let colors: Colors
		
		struct Colors {
			let accent: Accent
			let surface: Surface
			let content: Content
			
			struct Accent {
				let primary: Color
				let secondary: Color
			}
			struct Surface {
				let base: Color
				let secondary: Color
				let tertiary: Color
			}
			struct Content {
				let heading: Color
				let subheading: Color
				let description: Color
			}
		}
		
		struct Text {
			
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
