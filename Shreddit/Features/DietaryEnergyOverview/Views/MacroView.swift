//
//  MacroCircleView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/19/25.
//

import SwiftUI

struct MacroView: View {
	// MARK: Dependencies
	
	let macro: Macro
	
	init (_ macro: Macro) {
		self.macro = macro
	}
    var body: some View {
		
		VStack (spacing: Design.space.m){
			
			ZStack {
				Graph(progress: progress)
				
				VStack {
					Text(
						macro.kind.title.first?.uppercased() ?? ""
					)
					Text (macro.mass.description)
						.font(.caption)
						.foregroundStyle(.secondary)
				}
			}
		}
    }
}

private extension MacroView {
	var progress: Double {
		let currentValue = Double(macro.mass.value)
		let goal = Double(100)
		let sanitizedGoal = min(currentValue / goal, 1)
		return sanitizedGoal
	}
	
	
	struct Graph: View {
		let progress: Double
		let size: CGFloat = Design.size.m
		let accentColor: Color = .green
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
				.scaleEffect(1.15)
				.foregroundStyle(accentColor)
				
				Circle()
					.frame(width: size, height: size)
					.foregroundStyle(.background)

			}
				
		}
	
		var circleColor: Color {
			progress == 1 ? accentColor : Color(.systemGray3)
		}
	}
}

#Preview {
	MacroView(.init(kind: .protein, massValue: 80))
}
