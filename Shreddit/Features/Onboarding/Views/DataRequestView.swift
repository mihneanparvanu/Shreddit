//
//  DataRequestView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 10.07.2025.
//

import SwiftUI

struct DataRequestView: View {
    let healthManager: HealthManager
    @State private var didRequestAuthorization: Bool = false
    var body: some View {
        VStack {
            Text("Shreddit needs acces to your health data to help you get shredded. Please allow access in your settings.")

            if didRequestAuthorization {
                switch healthManager.userHasAuthorizedDataAccess() {
                case true:
                    succesfullyAuthroized
                case false:
                    notAuthorized
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

    @ViewBuilder var succesfullyAuthroized: some View {
        Text("Shreddit is now authorized to access your health data.")
    }

    @ViewBuilder var notAuthorized: some View {
        Text("Shreddit couldn't access your health data. Please allow access in your settings.")
    }
}

#Preview {
    DataRequestView(healthManager: HealthManager())
}
