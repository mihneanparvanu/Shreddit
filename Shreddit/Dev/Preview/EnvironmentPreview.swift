//
//  EnvironmentPreview.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/9/26.
//

import SwiftUI

extension View {
	func previewEnvironment () -> some View {
		self
	.environment(HealthManager())
	.environment(AppSettingsManager())
	.environment(AppOnboardingManager())
	}
}
 
