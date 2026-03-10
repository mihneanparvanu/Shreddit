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
		/// 20 pt
		let xS: CGFloat = 20
		/// 44 pt
		let s: CGFloat = 44
		/// 64 pt
		let m: CGFloat = 64
		/// 128 pt
		let l: CGFloat = 128
		/// 256 pt
		let xL: CGFloat = 256
	}
	static let size = Size()
	
	struct Space {
		/// 4 pt
		let base: CGFloat = 4
		/// 8 pt
		let xxxS: CGFloat = 8
		/// 12 pt
		let xxS: CGFloat = 12
		/// 16 pt
		let xS: CGFloat = 16
		/// 20 pt
		let s: CGFloat = 20
		/// 24 pt
		let m: CGFloat = 24
		/// 32 pt
		let l: CGFloat = 32
		/// 40 pt
		let xL: CGFloat = 40
		/// 56 pt
		let xxL: CGFloat = 56
		/// 64 pt
		let xxxL: CGFloat = 64
	}
	static let space = Space()

	fileprivate struct Palette {
		let lightBlue = Color("Colors/LightBlue")
		let gray100 = Color("Colors/Gray100")
		let gray200 = Color("Colors/Gray200")
		let gray300 = Color("Colors/Gray300")
		let gray400 = Color("Colors/Gray400")
		let gray500 = Color("Colors/Gray500")
	}
	fileprivate static let palette = Palette()
}

struct Theme {
	struct Colors {
			struct Accent {
				let primary: Color
			}
						
			struct Content {
				let primary: Color
				let secondary: Color
				let tertiary: Color
			}
		let accent: Accent
		let content: Content
	}
	
	let colors: Colors
	
	static let defaultTheme = Theme(colors: Colors(
		accent: .init(primary: Design.palette.lightBlue),
		content: .init(
			primary: Design.palette.gray200,
			secondary: Design.palette.gray300,
			tertiary: Design.palette.gray500
			)
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
