//
//  CaloriesLeftView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct CaloriesLeftView: View {
	let caloriesLeft: Int
    var body: some View {
		Text(calorieText)
			.font(.system(size: 24))
    }
	
	private var calorieText: AttributedString {
		var part1 = AttributedString("Have fun eating the rest ")
		let part2 = AttributedString("\(caloriesLeft)")
		var part3 = AttributedString(" calories today")
		
		part1.foregroundColor = .gray
		part3.foregroundColor = .gray
		
		return part1 + part2 + part3
	}
}

#Preview {
	CaloriesLeftView(caloriesLeft: 500)
}
