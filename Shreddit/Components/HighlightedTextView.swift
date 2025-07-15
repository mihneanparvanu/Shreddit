//
//  HighlightedTextView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct HighlightedTextView: View {
	let beforeHighlight: String
	let highlightedValue: String
	let afterHighlight: String
    var body: some View {
		Text(calorieText)
			.font(.system(size: 24))
    }
	
	///Highlight a number value
	init(beforeHighlight: String, highlightedValue: Int, afterHighlight: String) {
		self.beforeHighlight = beforeHighlight
		self.highlightedValue = String(highlightedValue)
		self.afterHighlight = afterHighlight
	}
	
	///Highlight a piece of text
	init(beforeHighlight: String, highlightedText: String, afterHighlight: String){
		self.beforeHighlight = beforeHighlight
		self.highlightedValue = highlightedText
		self.afterHighlight = afterHighlight
	}
	
	private var calorieText: AttributedString {
		var part1 = AttributedString(beforeHighlight)
		let part2 = AttributedString(" \(highlightedValue) ")
		var part3 = AttributedString(afterHighlight)
		
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
