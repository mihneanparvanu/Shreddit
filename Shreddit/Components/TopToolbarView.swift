//
//  TopToolbarView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct TopToolbarView <Content: View> : View  {
	//MARK: Dependencies
	let spacing: CGFloat? = nil
	@ViewBuilder let content: Content
	
	var body: some View {
		HStack (spacing: spacing){
			content
		}
		.padding()
	}
}

#Preview {

}
