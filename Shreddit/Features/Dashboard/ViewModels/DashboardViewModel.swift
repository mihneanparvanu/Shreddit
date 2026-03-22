//
//  DashboardViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import Observation
import SwiftUI

@MainActor
@Observable
final class DashboardViewModel {
    // MARK: Properties
	
	// MARK: Dependencies & Properties

	let healthManager: HealthManager

	// MARK: Initializer

	init(healthManager: HealthManager) {
		self.healthManager = healthManager
	}

	// MARK: Methods
	func present(_ content: DashboardView.ContentType) {
		presentedContent = content
	}
	
    private var presentedContent: DashboardView.ContentType?

    var sheetContent: DashboardView.ContentType? {
        get {
            guard let presentedContent, presentedContent.presentation == .sheet else {
                return nil
            }
            return presentedContent
        }
        set {
            presentedContent = newValue
        }
    }

    var fullScreenContent: DashboardView.ContentType? {
        get {
            guard let presentedContent, presentedContent.presentation == .fullScreen else {
                return nil
            }
            return presentedContent
        }
        set {
            presentedContent = newValue
        }
    }

    var popupContent: DashboardView.ContentType? {
        get {
            guard let presentedContent, presentedContent.presentation == .popup else {
                return nil
            }
            return presentedContent
        }
        set {
            presentedContent = newValue
        }
    }
}
