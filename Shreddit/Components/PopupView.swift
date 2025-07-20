//
//  PopupView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct PopupView<MainContent: View, PopupContent: View>: View {
	@ViewBuilder var content: () -> MainContent
	@ViewBuilder var popupContent: () -> PopupContent
    var body: some View {
		ZStack {
			content()
				.allowsHitTesting(false)
			
			Color.black.opacity(0.5)
				.ignoresSafeArea()
			
			popupContent()
		}
    }
}

#Preview {
    PopupView()
}
