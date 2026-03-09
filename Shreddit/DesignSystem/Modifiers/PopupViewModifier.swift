//
//  PopupViewModifier.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct BooleanPopupViewModifier<PopupContent: View>: ViewModifier {
    // MARK: Dependencies

    @Binding var isPresented: Bool
    @ViewBuilder let popupContent: () -> PopupContent

    func body(content: Content) -> some View {
        if isPresented {
            PopupView(mainContent: { content }) {
                popupContent()
            }
        } else {
            content
        }
    }
}

struct ItemPopupViewModifier<Item: Identifiable, PopupContent: View>: ViewModifier {
    // MARK: Dependencies

    @Binding var item: Item?
    @ViewBuilder let popupContent: (Item) -> PopupContent

    func body(content: Content) -> some View {
        if let item = item {
            PopupView(mainContent: { content }) {
                popupContent(item)
            }
        } else {
            content
        }
    }
}

extension View {
    func popup(isPresented: Binding<Bool>, @ViewBuilder popupContent: @escaping () -> some View) -> some View {
        modifier(
            BooleanPopupViewModifier(
                isPresented: isPresented,
                popupContent: popupContent
            )
        )
    }

    func popup<Item: Identifiable>(item: Binding<Item?>, @ViewBuilder popupContent: @escaping (Item) -> some View) -> some View {
        modifier(ItemPopupViewModifier(item: item, popupContent: popupContent))
    }
}

#Preview {
    @Previewable @Environment(\.theme) var theme

    Text("Hello World")
        .font(.title.bold())
		.foregroundStyle(theme.colors.accent.primary)
        .infinityFrame()
		.background(theme.colors.accent.primary)
}
