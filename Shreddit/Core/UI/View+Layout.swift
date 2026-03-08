//
//  View+Layout.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/9/26.
//

import SwiftUI

enum InfinityFrameAxis {
	case width
	case height
	case all

	var width: CGFloat? {
		switch self {
		case .width, .all:
			return .infinity
		default:
			return nil
		}
	}

	var height: CGFloat? {
		switch self {
		case .height, .all:
			return .infinity
		default:
			return nil
		}
	}
}


extension View {
	func infinityFrame(_ axis: InfinityFrameAxis = .all) -> some View {
		frame(maxWidth: axis.width, maxHeight: axis.height)
	}
}


extension View {
	func frame(size: CGFloat) -> some View {
		frame(width: size, height: size)
	}
}
