//
//  MacroCirclesView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/5/26.
//

import SwiftUI

struct MacroCirclesView: View {
	let macros: [Macro]
	let size: MacroView.Size
	let variant: MacroView.Variant
	
	
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
		HStack {
			
			ForEach(sortedMacros, id: \.kind.title) {macro in
				
				MacroView(macro, size: size, variant: variant)
				
			}
		} 
	}
}
