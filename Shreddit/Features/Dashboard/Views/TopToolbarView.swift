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
	let dietSimulatorButtonAction: () -> Void
	
	var body: some View {
		HStack {
			Menu{
				MenuItem(title: "Settings",
						 image: "gear",
						 action: settingsButtonAction)
				MenuItem(title: "Diet Simulator",
						 image: "play.circle.fill",
						 action: dietSimulatorButtonAction)
			}
			label: {
				Image(systemName: "ellipsis")
			}
			.tint(.primary)
			
			
			
			
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

extension TopToolbarView {
	struct MenuItem: View {
		let title: String
		let image: String
		let action: () -> Void
		var body: some View {
			Button {
				action()
			} label: {
				Label(title, systemImage: image)
			}
		}
	}
}

#Preview {
	TopToolbarView(settingsButtonAction: {}, dietSimulatorButtonAction: {})
}
