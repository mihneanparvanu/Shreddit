//
//  ContentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	@State private var vm = DashboardViewViewModel()
	
	var body: some View {
		VStack {
			Image(systemName: "shoe")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Steps today")
			Text("\(vm.steps)")
				.font(.title)
		}
		VStack {
			Image(systemName: "fire")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Active energy today")
			Text("\(vm.totalEnergyBurnded) kcalories")
				.font(.title)
		}
		.padding()
	}
}


#Preview {
	DashboardView()
}
