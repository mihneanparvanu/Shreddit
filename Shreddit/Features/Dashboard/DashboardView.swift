//
//  ContentView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 02.07.2025.
//

import SwiftUI

struct DashboardView: View {
	@Environment(AppSettingsManager.self) var settingsManager
	@State private var vm = DashboardViewModel(healthManager: HealthManager())
	@State private var caloriesEaten: Int = 0
	
	var body: some View {
		VStack {
			topToolbar
			
			VStack (alignment: .leading){
				Text("Calories eaten")
					.font(.headline)
				
				TextField(value: $caloriesEaten, format: .number){
					Text("Calories eaten")
				}
			}
			.padding()
			
			
			if caloriesEaten > 0 {
				caloriesLeftView
			}
			
			
			activitySummary
			
			Spacer()
		}
		.infinityFrame()
		.background()
		.sheet(item: $vm.sheetContent){content in
			switch content {
				case .settings:
					SettingsView()
				case .faq:
					Text("FAQ")
				case .profile:
					Text("Profile")
			}
		}
	}
	
	@ViewBuilder var topToolbar: some View {
		HStack {
			Button {
				vm.presentedContent = .settings
			} label : {
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
	}

	@ViewBuilder var caloriesLeftView: some View {
		HStack {
			Text("Have fun eating the rest")
				.foregroundStyle(.gray)
			Text(caloriesLeft, format: .number)
			Text("calories today")
				.foregroundStyle(.gray)
		}
		
	}
	
	@ViewBuilder var activitySummary: some View {
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

extension DashboardView {
	var deficit: Int {
		600
	}
	
	var caloriesLeft: Int {
		(vm.totalEnergyBurned - caloriesEaten) - deficit
	}
}


#Preview {
	DashboardView()
		.environment(AppSettingsManager())
}
