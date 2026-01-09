//
//  CardView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/21/25.
//

import SwiftUI

struct CardView<Content: View>: View {
    let title: String
    let content: () -> Content
    var body: some View {
        VStack {
            Text(title)

            content()
                .scaleEffect(x: 0.55, y: 0.55)
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.systemGray6))
        }
    }
}

#Preview {
    CardView(title: "Calories in") {
        Text("Test")
    }
}
