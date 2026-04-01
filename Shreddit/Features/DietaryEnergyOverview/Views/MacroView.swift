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
		
		VStack (spacing: Design.space.m){
			ZStack {
				Graph(progress: progress)
				
				VStack{
					Text(macroData.currentValue.description + "g")
				}
				.font(.caption)
			}
			
			Text(macroData.macro.rawValue.capitalized)
				.font(.subheadline.weight(.semibold))
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
		let size: CGFloat = Design.size.m
		var body: some View {

			ZStack {

				Path { path in
					let center = CGPoint(x: size/2, y: size/2)
					path.move(to: center)
					path
						.addArc(
							center: center,
							radius: size/2,
							startAngle: .degrees(270),
							endAngle: .degrees(270 - (-360 * progress)),
							clockwise: false
						)
				
				}
				
				.frame(width: size, height: size)
				.scaleEffect(1.1)
					.foregroundStyle(.accent)
				
				Circle()
					.frame(width: size, height: size)
					.foregroundStyle(circleColor)

			}
				
		}
	
		var circleColor: Color {
			progress == 1 ? .accent : Color(.systemGray3)
		}
	}
}

#Preview {
	MacroView(.init(macro: .protein, currentValue: 140, goal: 150))
}
