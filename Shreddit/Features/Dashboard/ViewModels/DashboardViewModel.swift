//
//  DashboardViewViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 04.07.2025.
//

import Observation

@MainActor
@Observable
final class DashboardViewModel {
	//MARK: Properties
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
	
	//MARK: Methods
	func present(_ content: DashboardView.ContentType) {
		presentedContent = content
	}
}

