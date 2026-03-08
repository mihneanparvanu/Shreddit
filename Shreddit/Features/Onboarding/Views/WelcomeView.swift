//
//  WelcomeView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 07.07.2025.
//

import SwiftUI


extension OnboardingView {
    struct WelcomeView: View {
		@Environment(\.designSystem) var design

        var body: some View {
			VStack (alignment: .leading) {
				Text ("Welcome to Shreddit")
					.font(.largeTitle).fontWeight(.semibold)
					
			}
			.padding(.top, 24)
			.padding(.trailing, 50)
			
            Spacer()

            VStack(alignment: .leading) {
                Text("You’re getting shredded this summer ☀️")
					.font(.title2).fontWeight(.semibold)

                Text("Get into the shape of your life. No BS, no burnout, just the exact calories left until you look insane.")
                    .foregroundStyle(.gray)
            }
			
			Spacer()
        }
    }
}

#Preview {
    OnboardingView.WelcomeView()
}
