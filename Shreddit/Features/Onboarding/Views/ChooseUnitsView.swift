//
//  ChooseUnitsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

struct ChooseUnitsView: View {
    var body: some View {
		Form {
			Text("Choose your units")
				.font(.title)
			
			Section ("Weight"){
				Picker("Weight", selection: $units.weightUnit){
					ForEach ("kg lbs".split(separator: " "), id: \.self){unit in
						Text(unit)
					}
				}
			}
		}
    }
}

#Preview {
    ChooseUnitsView()
}


