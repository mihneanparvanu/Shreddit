//
//  DietStatsView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 11.07.2025.
//

import SwiftUI

struct DietView: View {
    // MARK: Dependencies

    let diet: Diet?
    let healthManager: HealthManager
    let settingsManager: any SettingsManager

    // MARK: State

    @State var vm: DietViewModel
    @State private var isSheetPresented: Bool = false
    @State private var dietFatigueState: DietFatigueState?

    // MARK: Initializer

    init(diet: Diet?,
         healthManager: HealthManager,
         settingsManager: any SettingsManager)
    {
        self.diet = diet
        self.healthManager = healthManager
        self.settingsManager = settingsManager
        vm = .init(
            diet: diet,
            healthManager: healthManager,
            settingsManager: settingsManager
        )
    }

    var body: some View {
        if diet != nil {
            VStack {
                HighlightedTextView(
					highlight: .init(value: vm.remainingDeficit),
                    content: .init(afterHighlight: "calories remaining until goal body fat")
                )
            }
        }
    }
}

#Preview {
    let user = User.preview
    DietView(
        diet: user.currentDiet,
        healthManager: HealthManager(),
        settingsManager: AppSettingsManager()
    )
    .environment(AppSettingsManager())
}
