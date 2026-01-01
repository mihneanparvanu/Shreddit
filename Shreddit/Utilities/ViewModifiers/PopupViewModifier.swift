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
			PopupView(mainContent: {content}) {
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
			PopupView(mainContent: {content}) {
				popupContent(item)
			}
		} else {
			content
		}
	}
}

extension View {
	func popup (isPresented: Binding<Bool>, @ViewBuilder popupContent: @escaping () -> some View) -> some View {
		self.modifier(
			BooleanPopupViewModifier(
				isPresented: isPresented,
				popupContent: popupContent
			)
		)
	}
	
	func popup<Item: Identifiable>(item: Binding<Item?>, @ViewBuilder popupContent: @escaping (Item) -> some View) -> some View {
		self.modifier(ItemPopupViewModifier(item: item, popupContent: popupContent))
	}
}

#Preview {
	@Previewable @Environment(\.designSystem) var design
	
	Text("Hello World")
		.font(.title.bold())
		.foregroundStyle(design.colors.surface.base)
		.infinityFrame()
		.background(design.colors.accent.primary)
}

