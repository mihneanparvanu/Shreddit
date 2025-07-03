//
//  ContentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	let healthManager = HealthManager()
	@State private var steps = 0
	@State private var activeEnergy = 0
	
	var body: some View {
		VStack {
			Image(systemName: "shoe")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Steps today")
			Text("\(steps)")
				.font(.title)
		}
		.padding()
	}
}

#Preview {
	DashboardView()
}
