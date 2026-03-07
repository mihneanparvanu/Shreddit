//
//  MenuView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct MenuView<Content: View>: View {
    // MARK: Dependencies

	@ViewBuilder let content: Content
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}

    var body: some View {
        Menu {
				content
        }
        label: {
            Image(systemName: "ellipsis")
        }
        .tint(.primary)
    }
}

extension MenuView {
    struct MenuItem: View {
        let title: String
        let image: String
        let action: () -> Void
        var body: some View {
            Button {
                action()
            } label: {
                Label(title, systemImage: image)
            }
        }
    }
}

#Preview {
	MenuView{
		EmptyView()
	}
}
