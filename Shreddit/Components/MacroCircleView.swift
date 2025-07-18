//
//  MacroCircleView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/19/25.
//

import SwiftUI

struct MacroCircleView: View {
	//MARK: Dependencies
	let goal: Int
	let current: Int
	let title: String
	
	//MARK: State
	@State private var circleSize: CGSize = .zero
	var body: some View {
		ZStack {
			VStack {
				Text (title)
			}
	
			.padding(40)
			.background{
				Color.gray.opacity(0.2)
			}
			.clipShape(.circle)
			
			GraphView(current: current,
					  goal: goal)
				.stroke(style: .init(lineWidth: 10, lineCap: .round))
				.foregroundStyle(DesignConstants.Colors.Brand.primary)
				.frame(size: 100)
			
		}
	}
}

extension MacroCircleView {
	struct GraphView: Shape {
		//MARK: Dependencies
		let current: Int
		let goal: Int
		
		func path(in rect: CGRect) -> Path {
			let startAngle: Angle = .degrees(150)
			let angleRange: Angle = .degrees(230)
			
			var endAngle: Angle {
				// Calculate progress and clamp it to 1
				let progress = min(Double(current) / Double(goal), 1)
				
				// End angle is start angle + the total angle to fill * the progress
				return startAngle + (angleRange * progress)
			}
			
		var path = Path()
			path
				.addArc(
					center: CGPoint(x: rect.midX,
									y: rect.midY),
					radius: rect.width/2,
					startAngle: startAngle,
					endAngle: endAngle,
					clockwise: false
				)
			return path
		}
	}
}


#Preview {
	MacroCircleView(goal: 230,
					current: 230,
					title: "Protein")
}
