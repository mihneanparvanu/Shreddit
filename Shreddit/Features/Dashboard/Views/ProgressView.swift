//
//  LeftUntilGoalView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 12.07.2025.
//

import SwiftUI

struct LeftUntilGoalView: View {
	@Environment(AppSettingsManager.self) var settingsManager
	let weightToLose: Double 
    var body: some View {
		Text(caloriesLeftText)
			.font(.system(size: 24))
    }
	
	private var caloriesLeftText: AttributedString {
		let value = AttributedString(caloriesLeftInDeficit.formatted(.number))
		var text = AttributedString(" calories left in this deficit")
		
		text.foregroundColor = .gray
		
		return value + text
	}
}

extension LeftUntilGoalView {
	var caloriesLeftInDeficit: Int {
		Int(
			weightToLose * settingsManager.settings.units.massUnit.caloriesMultiplier
		)
	}
}

#Preview {
	LeftUntilGoalView(weightToLose: 6.8)
}
