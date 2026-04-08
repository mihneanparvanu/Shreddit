//
//  MacroViewStyle.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/9/26.
//

import SwiftUI

extension MacroView {
	struct Style {
		var size: Size = .medium
		var variant: Variant = .detailed
	}
}

private struct MacroViewStyleKey: EnvironmentKey {
	static let defaultValue: MacroView.Style = MacroView.Style()
}

extension EnvironmentValues {
	var macroViewStyle: MacroView.Style {
		get { self[MacroViewStyleKey.self]}
		set {self[MacroViewStyleKey.self] = newValue }
	}
}

extension View {
	
	func macroStyle(size: MacroView.Size? = nil, variant: MacroView.Variant? = nil) -> some View {
		self
			.modifier(MacroStyleModifier(size: size, variant: variant))
	}
	
}

private struct MacroStyleModifier: ViewModifier {
	let size: MacroView.Size?
	let variant: MacroView.Variant?
	
	@Environment(\.macroViewStyle) var currentStyle
	
	func body(content: Content) -> some View {
		var newStyle = currentStyle
		if let size { newStyle.size = size }
		if let variant { newStyle.variant = variant }
		
		return content.environment(\.macroViewStyle, newStyle)
	}
}
