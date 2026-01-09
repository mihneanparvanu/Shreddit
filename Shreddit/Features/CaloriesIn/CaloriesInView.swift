//
//  CaloriesInView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/20/25.
//

import SwiftUI

struct CaloriesInView: View {
    // MARK: Dependencies

    let healthManager: HealthManager
    let deficit: Int?

    // MARK: State

    @State private var vm: CaloriesInViewModel

    // MARK: Initializer

    init(healthManager: HealthManager,
         deficit: Int?)
    {
        self.healthManager = healthManager
        self.deficit = deficit
        vm = .init(healthManager: healthManager,
                   deficit: 500)
    }

    var body: some View {
        VStack {
            HighlightedTextView(
                highlight: .init(value: vm.caloriesLeft),
                content: .init(beforeHighlight: "Have fun eating the rest",
                               afterHighlight: "kilocalories today.")
            )

            HStack(spacing: 20) {
                HighlightedTextView(
                    highlight: .init(value: vm.protein.currentValue),
                    content: .init(afterHighlight: vm.protein.title)
                )

                HighlightedTextView(
                    highlight: .init(value: vm.carbs.currentValue),
                    content: .init(afterHighlight: vm.carbs.title)
                )

                HighlightedTextView(
                    highlight: .init(value: vm.carbs.currentValue),
                    content: .init(afterHighlight: vm.carbs.title)
                )
            }
        }
    }
}

#Preview {
    CaloriesInView(healthManager: HealthManager(),
                   deficit: 600)
}
