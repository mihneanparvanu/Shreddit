//
//  View+Lifecycle.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/9/26.
//

import SwiftUI

struct onViewReadyModifier: ViewModifier {
	@Environment(\.scenePhase) var scenePhase
	let action: () -> Void

	func body(content: Content) -> some View {
		content
			.onAppear {
				action()
			}
			.onChange(of: scenePhase) { newValue, _ in
				if newValue == .active {
					action()
				}
			}
	}
}

extension View {
	/// Performs an action when the view first appears and any time the scene becomes active.
	func onViewReady(perform: @escaping () -> Void) -> some View {
		modifier(onViewReadyModifier(action: perform))
	}
}
