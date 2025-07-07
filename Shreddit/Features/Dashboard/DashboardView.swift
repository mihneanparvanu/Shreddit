//
//  ContentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	@State private var vm = DashboardViewModel(healthManager: HealthManager())
	
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
			Image(systemName: "flame")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Active energy today")
			Text("\(vm.totalEnergyBurned) kcalories")
				.font(.title)
		}
		.padding()
		.task {
			await vm.setupAndFetch()
		}
		.alert(item: $vm.alert) { error in
			Alert(
				title: Text(error.title),
				message: Text(error.message),
				dismissButton: error.dismiss
			)
		}
	}
}


#Preview {
	DashboardView()
}
