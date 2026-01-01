//
//  HighlightedTextView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct HighlightedTextView: View {
	//MARK: Dependencies
	let highlight: Highlight
	let content: Content
	
	var body: some View {
		Text(highlightedText)
			.font(.system(size: 24))
	}

	private var highlightedText: AttributedString {
		var part1 = AttributedString(content.beforeHighlight)
		let part2 = AttributedString(" \(highlight.value) ")
		var part3 = AttributedString(content.afterHighlight)
		
		part1.foregroundColor = content.color
		part3.foregroundColor = content.color
		
		return part1 + part2 + part3
	}
}

extension HighlightedTextView {
	struct Highlight {
		let value: String
		let color: Color
		
		///Highlight a number value
		init(value: Int, color: Color = .primary) {
			self.value = value.formatted(.number)
			self.color = color
		}
		
		///Highlight a piece of text
		init (text: String, color: Color = .primary){
			self.value = text
			self.color = color
		}
	}
	struct Content {
		let beforeHighlight: String
		let afterHighlight: String
		let color: Color
		
		init(
			beforeHighlight: String = "",
			afterHighlight: String = "",
			color: Color = .gray
		) {
			self.beforeHighlight = beforeHighlight
			self.afterHighlight = afterHighlight
			self.color = color
		}
	}
}

#Preview {
	HighlightedTextView(
		highlight: .init(value: 1000),
		content: .init(beforeHighlight: "Have fun eating the rest",
						afterHighlight: "calories today.")
	)
}
