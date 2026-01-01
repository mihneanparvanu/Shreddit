//
//  MenuView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct MenuView: View {
	//MARK: Dependencies
	let dietSimulatorButtonAction: () -> Void
	let settingsButtonAction: () -> Void
	
    var body: some View {
		Menu{
			MenuItem(title: "Diet Simulator",
					 image: "play.circle.fill",
					 action: dietSimulatorButtonAction)
			
			MenuItem(title: "Settings",
					 image: "gear",
					 action: settingsButtonAction)
		}
		label: {
			Image(systemName: "ellipsis")
		}
		.tint(.primary)
    }
}

extension MenuView {
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
	MenuView(dietSimulatorButtonAction: {},
			 settingsButtonAction: {})
}
