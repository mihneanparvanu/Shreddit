//
//  ContentType.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 09.07.2025.
//

extension DashboardView {
	enum ContentType: Identifiable {
		var id: Self { self }
		case settings
		case profile
		case faq
		case dietSimulator
		
		var presentation: Presentation {
			switch self {
				case .profile, .settings:
						.sheet
				case .faq, .dietSimulator:
						.fullScreen
			}
		}
	}
}

extension DashboardView.ContentType {
	enum Presentation {
		case sheet, fullScreen
	}
}

