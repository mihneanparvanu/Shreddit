//
//  MacroCirclesView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftUI

struct MacroCirclesView: View {
	let macros: [Macro]
	let spacing: Spacing?
	
	init(_ macros: [Macro], spacing: Spacing? = nil) {
		self.macros = macros
		self.spacing = spacing
	}
	
	var sortedMacros: [Macro] {
		let prefferedOrder: [Macro.Kind] = [.protein, .carbs, .fats]
		let buffer = macros.count + 10
		return	macros.sorted { firstMacro, secondMacro in
			let firstIndex = prefferedOrder.firstIndex(of: firstMacro.kind) ?? buffer
			let secondIndex = prefferedOrder.firstIndex(of: secondMacro.kind) ?? buffer
			
			return firstIndex < secondIndex
		}
		
		
		
	}
	var body: some View {
		let stackSpacing: CGFloat? = {
			if case .value(let val) = spacing { return val}
			return nil
		}()
		
		HStack (spacing: stackSpacing){
			
			ForEach(
				Array(sortedMacros.enumerated()),
				id: \.element.kind
			) {
index,
 macro in
				
				if spacing == .spaceAround {
				Spacer()
				}
				
				MacroView(macro)
				
				if (spacing == .spaceAround) || (
					spacing == .spaceBetween && index != sortedMacros.count - 1
				) {
					Spacer()
				}
				
			}
		}
	}
}



extension MacroCirclesView {
	enum Spacing: Equatable {
		case spaceAround
		case spaceBetween
		case value(_ value: CGFloat)
	}
}
