//
//  HighlightedTextView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct HighlightedTextView: View {
	//MARK: Dependencies
	let beforeHighlight: String?
	let highlightedValue: String
	let afterHighlight: String?
	
	var body: some View {
		Text(highlightedText)
			.font(.system(size: 24))
	}
	
	///Highlight a number value
	init(
		beforeHighlight: String? = nil,
		highlightedValue: Int,
		afterHighlight: String? = nil
	) {
		self.beforeHighlight = beforeHighlight
		self.highlightedValue = highlightedValue.formatted(.number)
		self.afterHighlight = afterHighlight
	}
	
	///Highlight a piece of text
	init(beforeHighlight: String? = nil,
		 highlightedText: String,
		 afterHighlight: String? = nil){
		self.beforeHighlight = beforeHighlight
		self.highlightedValue = highlightedText
		self.afterHighlight = afterHighlight
	}
	
	private var highlightedText: AttributedString {
		var part1 = AttributedString(beforeHighlight ?? "")
		let part2 = AttributedString(" \(highlightedValue) ")
		var part3 = AttributedString(afterHighlight ?? "")
		
		part1.foregroundColor = .gray
		part3.foregroundColor = .gray
		
		return part1 + part2 + part3
	}
}

#Preview {
	HighlightedTextView(
		beforeHighlight: "Have fun eating the rest",
		highlightedValue: 500,
		afterHighlight: "calories today"
	)
}
