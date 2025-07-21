//
//  CaloriesInViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/21/25.
//

import Observation
import SwiftUI

@Observable
final class CaloriesInViewModel {
	//MARK: Dependencies & Properties
	
	let healthManager: HealthManager
	
	//MARK: Initializer
	init(healthManager: HealthManager) {
		self.healthManager = healthManager
	}
}
