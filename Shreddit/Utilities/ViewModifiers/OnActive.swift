//
//  OnActive.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

import SwiftUI


struct onActiveViewModifier: ViewModifier {
	@Environment(\.scenePhase) var scenePhase
	let action: () -> Void
	
	func body(content: Content) -> some View {
		content
			.onAppear {
				action()
			}
			.onChange(of: scenePhase) {newValue, oldValue in
				if newValue == .active {
					action()
				}
			}
	}
}

extension View {
	func onActive (action: @escaping () -> Void) -> some View {
		modifier(onActiveViewModifier(action: action))
	}
}
