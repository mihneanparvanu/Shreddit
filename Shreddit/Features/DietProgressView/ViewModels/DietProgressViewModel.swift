//
//  DietProgressViewModel.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 3/20/26.
//

import Observation

@Observable
@MainActor final class DietProgressViewModel {
	let diet: Diet
	
	init(diet: Diet) {
		self.diet = diet
		
	}
	
}
