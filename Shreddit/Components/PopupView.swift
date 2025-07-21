//
//  PopupView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct PopupView<MainContent: View, PopupContent: View>: View {
	@ViewBuilder var mainContent: () -> MainContent
	@ViewBuilder var popupContent: () -> PopupContent
    var body: some View {
		ZStack {
			mainContent()
				.allowsHitTesting(false)
			
			Color.black.opacity(0.69)
				.ignoresSafeArea()
			
			popupContent()
		}
    }
}

#Preview {
	@Previewable @Environment(\.designSystem) var design
	PopupView(mainContent: {design.colors.accent.primary},
			  popupContent: {})
}
