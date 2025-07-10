//
//  DataRequestView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

import SwiftUI

struct DataRequestView: View {
	let healthManager: HealthManager
    var body: some View {
		Text("Shreddit needs acces to your health data to help you get shredded. Please allow access in your settings.")
		
		Button("Allow") {
			Task {
				try await healthManager.requestAuthorization()
			}
		}
    }
}

#Preview {
	DataRequestView(healthManager: HealthManager())
}
