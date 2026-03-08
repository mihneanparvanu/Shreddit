//
//  SetupPhase.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

extension OnboardingContent {
	struct PreferencesView: View {
		@Binding var appearance: Appearance
		@Binding var selectedUnits: Units
		
		var body: some View {
			Form {
				Section("Choose your appearance") {
					Picker("Appearance", selection: $appearance) {
						ForEach(Appearance.allCases) { scheme in
							Text(scheme.title)
						}
					}
				}
				Section("Choose your units") {
					Picker("Weight", selection: $selectedUnits.unitMass) {
						ForEach(Settings.Units.MassUnit.allCases) { unit in
							Text(unit.rawValue)
						}
					}
					
					Picker("Energy", selection: $selectedUnits.unitEnergy) {
						ForEach(Settings.Units.EnergyUnit.allCases) { unit in
							Text(unit.rawValue)
						}
					}
				}
			}
			.scrollContentBackground(.hidden)
		}
	}
	
	struct EditGoalView: View {
		var body: some View {
			VStack {
				Text("Choose your goal look")
			}
			.padding()
		}
	}
	
	struct DataRequestView: View {
		let healthManager: HealthManager
		@State private var didRequestAuthorization: Bool = false
		var body: some View {
			VStack {
				Text("Shreddit needs acces to your health data to help you get shredded. Please allow access in your settings.")

				if didRequestAuthorization {
					switch healthManager.userHasAuthorizedDataAccess() {
					case true:
							Text("Shreddit is now authorized to access your health data.")
					case false:
							Text("Shreddit couldn't access your health data. Please allow access in your settings.")
					}
				}

				Button("Allow") {
					Task {
						try await healthManager.requestAuthorization()
						didRequestAuthorization = true
					}
				}

				Button("Open Settings") {
					if let url = URL(string: UIApplication.openSettingsURLString) {
						UIApplication.shared.open(url)
					}
				}
			}
		}
	}
}
