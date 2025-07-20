//
//  PopupViewModifier.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct BooleanPopupViewModifier<PopupContent: View>: ViewModifier {
	//MARK: Dependencies
	@Binding var isPresented: Bool
	@ViewBuilder let popupContent: () -> PopupContent
	
	func body(content: Content) -> some View {
		if isPresented {
			ZStack {
				content
					.allowsHitTesting(false)
				
				Color.black.opacity(0.5)
					.ignoresSafeArea()
				
				popupContent()
			}
		} else {
			content
		}
	}
}

struct ItemPopupViewModifier<Item: Identifiable, PopupContent: View>: ViewModifier {
	//MARK: Dependencies
	@Binding var item: Item?
	@ViewBuilder let popupContent: (Item) -> PopupContent
	func body(content: Content) -> some View {
		if let item = item {
			ZStack {
				content
				
				Color.black.opacity(0.5)
					.ignoresSafeArea()
				
				popupContent(item)
			}
		} else {
			content
		}
	}
}

extension View {
	}

#Preview {
	@Previewable @Environment(\.designSystem) var design
	
	Text("Hello World")
		.font(.title.bold())
		.foregroundStyle(design.colors.surface.base)
		.infinityFrame()
		.background(design.colors.accent.primary)
}
