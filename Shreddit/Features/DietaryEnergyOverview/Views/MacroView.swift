//
//  MacroCircleView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/19/25.
//

import SwiftUI

struct MacroView: View {
	// MARK: Dependencies
	
	let macroData: MacroData
	
	init (_ macroData: MacroData) {
		self.macroData = macroData
	}
	
	
    var body: some View {
	
		ZStack {
			Graph(progress: progress)
			
			VStack{
				Text(macroData.macro.rawValue.capitalized)
			}
			.foregroundStyle(.black)
			.font(.title3.weight(.semibold))
		}
	
		
    }
}

private extension MacroView {
	var progress: Double {
		let currentValue = Double(macroData.currentValue)
		let goal = Double(macroData.goal)
		let sanitizedGoal = min(currentValue / goal, 1)
		return sanitizedGoal
	}
	
	
	struct Graph: View {
		let progress: Double
		let maxHeight: CGFloat = 100
		var body: some View {
			ZStack (alignment: .bottom){
				Rectangle()
					.frame(height: maxHeight)
					.foregroundStyle(Color.gray.opacity(0.15))
				
				
				Rectangle()
					.foregroundStyle(.green)
					.frame(height: maxHeight * progress)
					.animation(
						.spring(response: 0.5, dampingFraction: 0.2),
						value: progress
					)
			}
			.frame(width: 100)
		}
	}
	
}


#Preview {
	MacroView(.init(macro: .protein, currentValue: 100, goal: 150))
}
