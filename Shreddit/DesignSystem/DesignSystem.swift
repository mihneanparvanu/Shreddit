//
//  DesignSystem.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI



// MARK: Design System
enum Design {
	struct Size {
		let base: CGFloat = 4
		let xxxS: CGFloat = 8
		let xxS: CGFloat = 12
		 let xS: CGFloat = 16
		 let s: CGFloat = 20
		 let m: CGFloat = 24
		 let l: CGFloat = 32
		 let xL: CGFloat = 40
		let xxL: CGFloat = 64
		let xxxL: CGFloat = 80
	}
	static let size = Size()
	
	struct Space {}
	static let space = Space()

	fileprivate struct Palette {
		struct Brand {
			let primary = Color(.systemBlue)
			let secondary = Color(.systemCyan)
		}
		let brand = Brand()
	}
	fileprivate static let palette = Palette()
}

struct Theme {
	struct Colors {
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
		let accent: Accent
	}
	
	let colors: Colors
	
	static let defaultTheme = Theme(
		colors: Colors(
			accent: .init(
				primary: Design.palette.brand.primary,
				secondary: Design.palette.brand.secondary)
		)
	)
}


private struct ThemeKey: EnvironmentKey {
	static let defaultValue: Theme = .defaultTheme
}

extension EnvironmentValues {
	var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
