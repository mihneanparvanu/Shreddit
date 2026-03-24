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
	

    // MARK: State

    var body: some View {
	
	
		ZStack{
			VStack {
				Spacer ()
				
				Rectangle()
					.foregroundStyle(.green)
					.frame(height: interpolation)
			}
			
			VStack{
				Text(macroData.macro.rawValue.capitalized)
				Text(interpolation.description)
			}
			.foregroundStyle(.black)
			.font(.title3.weight(.semibold))
        }
	
		.frame(width: 100, height: 100)
		.background(Color.gray.opacity(0.35))
    }
}

private extension MacroView {
	var interpolation: CGFloat {
		let currentVal = Double(macroData.currentValue)
		let goalVal = Double(macroData.goal)
		let ratio = currentVal / goalVal
		return min(ratio.interpolated(towards: 100, amount: ratio).rounded(), 100)
	}
}


#Preview {
	MacroView(.init(macro: .protein, currentValue: 145, goal: 150))
}
