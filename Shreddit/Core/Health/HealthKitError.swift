//
//  HealthKitError.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//


enum HealthKitError: Error {
	case notAvailableOnDevice, authorizationDenied, dataUnavailable
	var localizedDescription: String {
		switch self {
				case .notAvailableOnDevice:
				return "HealthKit is not available on this device."
			case .authorizationDenied:
				return "HealthKit authorization is denied."
			case .dataUnavailable:
				return "HealthKit data is unavailable."
		}
	}
}
