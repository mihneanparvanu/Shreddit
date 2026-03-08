//
//  SetupPhase.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/8/26.
//

import SwiftUI

extension OnboardingContent {
	
	struct GoalLookView: View {
		var body: some View {
			OnboardingStepView(title: "What's your goal look?", subheadline: "Goal weights are arbitrary. Pick the aesthetic you want.", bodyText: "Lorem ipsum") {
				HStack {
					VStack {
						Text ("Shredded")
						Text("10% body fat")
					}
				}
			}
		}
	}
	
	struct DietPaceView: View {
		var body: some View {
			OnboardingStepView(title: "What's your diet pace?", subheadline: "Dieting is hard.", bodyText: "Sustainable fat loss is capped at 0.9% of body weight per week. Faster than that, you burn muscle.")
		}
	}
	
	struct UserDataView: View {
		@Binding var settings: Settings
		let healthManager: HealthManager
		@State private var didRequestAuthorization: Bool = false
		var body: some View {
			VStack {
					Form {
						Section("Choose your appearance") {
							Picker("Appearance", selection: $settings.appearance) {
								ForEach(Appearance.allCases) { scheme in
									Text(scheme.title)
								}
							}
						}
						Section("Choose your units") {
							Picker("Weight", selection: $settings.units.massUnit) {
								ForEach(Settings.Units.MassUnit.allCases) { unit in
									Text(unit.title)
								}
							}
							
							Picker("Energy", selection:  $settings.units.energyUnit) {
								ForEach(Settings.Units.EnergyUnit.allCases) { unit in
									Text(unit.title)
								}
							}
						}
					}
					.scrollContentBackground(.hidden)
				}
			
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

