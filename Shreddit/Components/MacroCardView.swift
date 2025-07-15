//
//  MacroCardView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/15/25.
//

import SwiftUI

struct MacroCardView: View {
	//MARK: Dependencies
	let text: TextDependencies
	
    var body: some View {
		HStack (spacing: 40){
			TextView(title: text.title,
					 quantity: text.quantity,
					 unit: text.unit
			)
			
			GraphView(color: .brandPrimary)
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
		let title: String
		let quantity: Int
		let unit: String
		
		var body: some View {
			VStack (alignment: .leading, spacing: 8) {
				Text(title)
					.font(.title2)
					.foregroundStyle(.gray.opacity(0.9))
				
				Text(valueText)
					.font(.system(size: 40))
			}
		}
		
		private var valueText: AttributedString {
			let value =  AttributedString(quantity.formatted(.number))
			let unit = AttributedString(" \(unit)")
			
			return value + unit
		}
	}
	
	struct TextDependencies {
		let title: String
		let quantity: Int
		let unit: String
	}
}


//MARK: GraphView

extension MacroCardView {
	struct GraphView: View {
		//MARK: Dependencies
		let color: Color
		
		var body: some View {
			ZStack {
				GraphCircle()
					.stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round))
					.foregroundStyle(color)
				
				Circle()
					.stroke(style: StrokeStyle(lineWidth: 22, lineCap: .round))
					.foregroundStyle(color.opacity(0.1))
			}
			.frame(height: 200)
			.padding(44)
			.background(color.opacity(0.4))
			.clipShape(
				.rect(
					cornerRadius: backgroundCornerRadius
				)
			)
		}
	}
}

extension MacroCardView.GraphView {
	private var backgroundCornerRadius: CGFloat {
		abs(MacroCardView.padding - MacroCardView.cornerRadius)
	}
	
	struct GraphCircle: Shape {
		
		func path(in rect: CGRect) -> Path {
			var path = Path()
		
			path
				.addArc(
					center: CGPoint(x: rect.midX, y: rect.midY),
					radius: rect.width / 2,
					startAngle:.degrees(-90),
					endAngle: .degrees(-50),
					clockwise: false
				)
			
			return path
		}
	}
}


#Preview {
	ZStack {
		Color.gray
		
		MacroCardView(text: .init(title: "Protein",
								  quantity: 230,
								  unit: "g"
								 )
		)
	}
	.ignoresSafeArea()
}


