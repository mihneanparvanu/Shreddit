//
//  ProfilePictureBorder.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfilePictureBorderViewModifier: ViewModifier {
	
	@Environment(\.designSystem) var design
    @State var size: CGFloat = 0
    let color: Color

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            size = geo.size.width
                        }
                }
                Circle()
                    .foregroundStyle(color)
					.frame(size: size * 1)
            }
            .padding(.bottom, size * 0.1)
    }
}

extension View {
    func profilePictureBorder(color: Color) -> some View {
        modifier(
            ProfilePictureBorderViewModifier(color: color)
        )
    }
}
