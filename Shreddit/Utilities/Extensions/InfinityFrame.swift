//
//  InfinityFrame.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

import SwiftUI

extension View {
	func infinityFrame(_ axis: InfinityFrameAxis = .all) -> some View {
		frame(maxWidth: axis.width, maxHeight: axis.height)
	}
}

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

