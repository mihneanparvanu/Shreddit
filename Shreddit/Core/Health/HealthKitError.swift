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
				return "HealthKit is not available on this device."
			case .dataUnavailable:
				return "HealthKit data is unavailable."
		}
	}
}
