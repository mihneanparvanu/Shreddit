//
//  HealthKitError.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

enum HealthKitError: Error {
    case notAvailableOnDevice, dataUnavailable
    var localizedDescription: String {
        switch self {
        case .notAvailableOnDevice:
            "HealthKit is not available on this device."
        case .dataUnavailable:
            "HealthKit data is unavailable."
        }
    }
}
