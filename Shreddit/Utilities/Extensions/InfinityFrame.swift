//
//  InfinityFrame.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import SwiftUI
extension View {
	func infinityFrame(fill: InfinityFrameFillAxis) -> some View {
		switch fill {
				case .width:
				frame(maxWidth: .infinity)
			case .height:
				frame(maxHeight: .infinity)
			case .widthAndHeight:
				frame(maxWidth: .infinity, maxHeight: .infinity)
		}
	}
}

enum InfinityFrameFillAxis {
	case width
	case height
	case widthAndHeight
}

