//
//  MacroCardView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/15/25.
//

import SwiftUI

struct MacroCardView: View {
	//MARK: Dependencies
	let goal: Int
	let currentValue: Int
	let text: TextDependencies
	let graph: GraphDependencies
	
	var body: some View {
		HStack (spacing: 40){
			TextView(currentValue: currentValue,
						 title: text.title,
						 unit: text.unit
			)
			
			GraphView(goal: goal,
					  currentValue: currentValue,
					  color: graph.color)
			.frame(width: 200, height: 200)
		}
		.padding(.leading, 40)
		.padding(.trailing, MacroCardView.padding)
		.padding(.vertical, MacroCardView.padding)
		.background()
		.clipShape(.rect(cornerRadius: MacroCardView.cornerRadius))
	}
}

extension MacroCardView {
	static private let padding: CGFloat = 8
	static private let cornerRadius: CGFloat = 40
}

//MARK: TextView
extension MacroCardView {
	struct TextView: View {
		//MARK: Dependencies
		let currentValue: Int
		let title: String
		let unit: String
		
		//MARK: Environment
		@Environment(\.designSystem) var design
		
		var body: some View {
			VStack (alignment: .leading) {
				Text(title)
					.font(.title2)
					.foregroundStyle(.gray.opacity(0.9))
				
				Text(valueText)
					.foregroundStyle(design.colors.content.heading)
					.font(.system(size: DesignConstants.Sizing.mediumLarge))
			
			}
		}
		
		private var valueText: AttributedString {
			let value =  AttributedString(currentValue.formatted(.number))
			let unit = AttributedString(" \(unit)")
			
			return value + unit
		}
	}
	
	struct TextDependencies {
		let title: String
		let unit: String
	}
}


//MARK: GraphView

extension MacroCardView {
	struct GraphView: View {
		//MARK: Dependencies
		let goal: Int
		let currentValue: Int
		let color: Color
		
		var body: some View {
			ZStack {
				GraphCircle(goal: goal,
							currentValue: currentValue
				)
				.stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round))
				.foregroundStyle(color)
				
				Circle()
					.stroke(style: StrokeStyle(lineWidth: 22, lineCap: .round))
					.foregroundStyle(color.opacity(0.2))
			}
			.padding(44)
			.background(color.opacity(0.4))
			.clipShape(
				.rect(
					cornerRadius: backgroundCornerRadius
				)
			)
		}
	}
	
	struct GraphDependencies {
		let color: Color
	}
}

extension MacroCardView.GraphView {
	private var backgroundCornerRadius: CGFloat {
		abs(MacroCardView.padding - MacroCardView.cornerRadius)
	}
	
	struct GraphCircle: Shape {
		//MARK: Dependencies
		let goal: Int
		let currentValue: Int
		
		let startAngle: Angle = .degrees(-90)
		let angleRange: Angle = .degrees(360)
		var endAngle: Angle {
			// Calculate progress and clamp it to 1
			let progress = min(Double(currentValue) / Double(goal), 1)
			
			// The end angle will be the start + the total angle to fill * progress
			// Total angle to fill is negative because the direction is clockwise
			return startAngle + (-angleRange * progress)
		}
		
		func path(in rect: CGRect) -> Path {
			var path = Path()
			
			path
				.addArc(
					center: CGPoint(x: rect.midX, y: rect.midY),
					radius: rect.width / 2,
					startAngle: startAngle,
					endAngle: endAngle,
					clockwise: true
				)
			
			return path
		}
	}
}


#Preview {
	ZStack {
		Color.gray
		
		MacroCardView(
			goal: 230,
			currentValue: 200,
			text: .init(
				title: "Protein",
				unit: "g"
			),
			graph: .init(color: DesignConstants.Colors.Brand.primary)
		)
	}
	.ignoresSafeArea()
}


