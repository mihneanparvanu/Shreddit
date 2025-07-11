//
//  TopToolbarView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct TopToolbarView: View {
	//MARK: Dependencies
	let settingsButtonAction: () -> Void
	
    var body: some View {
			HStack {
				Button {
					print ("Pressed")
					settingsButtonAction()
				} label: {
					Image(systemName: "gear")
				}
				.padding()
				.buttonStyle(.glass)
				
				Spacer()
				
				HStack {
					Text(Date().formatted(.dateTime.month(.abbreviated).day()))
					
					Image(.profilePicture)
						.resizable()
						.scaledToFit()
						.frame(size: 24)
						.clipShape(Circle())
				}
				.padding(.trailing)
			}
			.padding()
		}
}

#Preview {
	TopToolbarView(settingsButtonAction: {})
}
