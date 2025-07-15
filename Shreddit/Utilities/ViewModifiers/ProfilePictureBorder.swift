//
//  ProfilePictureBorder.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfilePictureBorderViewModifier: ViewModifier {
	@State var size: CGFloat = 0
	let color: Color
	
	func body(content: Content) -> some View {
		content
			.background{
				GeometryReader { geo in
					Color.clear
						.onAppear{
							size = geo.size.width
						}
				}
				Circle()
					.foregroundStyle(color)
					.frame(size: size * DesignConstants.Sizing.smallMultiplier)
			}
			.padding(.bottom, size * 0.1)
	}
}

extension View {
	func profilePictureBorder(color: Color) -> some View {
		self.modifier(
			ProfilePictureBorderViewModifier(color: color)
		)
	}
}
