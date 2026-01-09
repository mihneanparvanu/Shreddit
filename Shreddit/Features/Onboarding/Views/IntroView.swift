//
//  IntroView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Text("What does shreddit do?")
                .font(.title)
            Text("Shreddit helps you get leaner than you've ever been by creating a sustainable fat loss phase, showing you exactly how long you've got until your goal look and helping you stay motivated by displaying your progress and celebrating your achievements.")
        }
        .padding()
    }
}

#Preview {
    IntroView()
}
