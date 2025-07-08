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
			Text("Choose your goal look")
		}
		.padding()
	}
}

#Preview {
	EditGoalView(goalWeight: .constant(0))
}
