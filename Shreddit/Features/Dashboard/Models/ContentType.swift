//
//  ContentType.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

extension DashboardView {
	enum ContentType: Identifiable {
		var id: Self { self }
		// Sheet
		case settings
		case profile
		
		// Fullscreen
		case faq
		case dietSimulator
		
		// Popup
		case caloriesIn
		case caloriesOut
		
		var presentation: Presentation {
			switch self {
				case .profile, .settings:
						.sheet
				case .faq, .dietSimulator:
						.fullScreen
				case .caloriesIn, .caloriesOut:
						.popup
			}
		}
	}
}

extension DashboardView.ContentType {
	enum Presentation {
		case sheet, fullScreen, popup
	}
}

extension DashboardView.ContentType.Presentation {
	var isFullscreen: Bool {
		switch self {
			case .fullScreen: return true
			case .sheet, .popup: return false
		}
	}
}
