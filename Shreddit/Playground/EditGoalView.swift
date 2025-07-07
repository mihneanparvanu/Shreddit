//
//  EditGoalView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

struct EditGoalView: View {
	@Binding var goalWeight: Double
	var body: some View {
		VStack {
			Text("Enter your goal weight")
			TextField(
				"Goal weight",
				value: $goalWeight, format: .number
			)
		}
		.padding()
	}
}

#Preview {
	EditGoalView(goalWeight: .constant(0))
}
