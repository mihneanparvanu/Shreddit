//
//  DevPreview.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/7/26.
//

import Foundation

/// We use an enum instead of a struct so it can't be accidentally instantiated
enum DevPreview {
    // MARK: - USERS

    enum Users {
        static let main: User = .init(
            firstName: "Mihnea",
            lastName: "Parvanu",
            username: "m",
            email: nil,
            password: nil,
            image: "Preview/mProfileImage",
            createdAt: Date(),
            settings: nil,
            currentDiet: .init(
                startDate: Date.from(year: 2026, month: 1, day: 1),
                endDate: .distantFuture,
                startWeight: 70,
                currentAvgWeight: 61.5,
                goalWeight: 56.25,
                difficulty: .custom(.init(1.0)!),
                activeLedger: 0,
                tdeePenalty: 0
            ),
            metabolism: .init(tdeeCalories: 2600, intakeCalories: 2000)
        )
    }

    enum Foods {
        /// Existing
        static let cottageCheese = Food(name: "Cottage Cheese", photo: nil, category: .dairy, macros: [
            Macro(kind: .protein, massValue: 12.5),
            Macro(kind: .fats, massValue: 2.0),
            Macro(massValue: 2.0, fiberValue: 0, sugarValue: 2.0),
        ])

        static let blueberries = Food(name: "Blueberries", photo: nil, category: .fruit, macros: [
            Macro(kind: .protein, massValue: 0.74),
            Macro(kind: .fats, massValue: 0.33),
            Macro(massValue: 14.49, fiberValue: 2.4, sugarValue: 9.96),
        ])

        // New: Breakfast
        static let eggWhites = Food(name: "Egg Whites", photo: nil, category: .egg, macros: [
            Macro(kind: .protein, massValue: 10.9),
            Macro(kind: .fats, massValue: 0.2),
            Macro(massValue: 0.7, fiberValue: 0, sugarValue: 0.7),
        ])

        static let avocado = Food(name: "Avocado", photo: nil, category: .fruit, macros: [
            Macro(kind: .protein, massValue: 2.0),
            Macro(kind: .fats, massValue: 14.7),
            Macro(massValue: 8.5, fiberValue: 6.7, sugarValue: 0.7),
        ])

        static let babySpinach = Food(name: "Baby Spinach", photo: nil, category: .vegetable, macros: [
            Macro(kind: .protein, massValue: 2.9),
            Macro(kind: .fats, massValue: 0.4),
            Macro(massValue: 3.6, fiberValue: 2.2, sugarValue: 0.4),
        ])

        // New: Lunch
        static let chickenBreast = Food(name: "Chicken Breast", photo: nil, category: .meat, macros: [
            Macro(kind: .protein, massValue: 22.5),
            Macro(kind: .fats, massValue: 2.6),
            Macro(massValue: 0.0, fiberValue: 0.0, sugarValue: 0.0),
        ])

        static let sweetCorn = Food(name: "Sweet Corn", photo: nil, category: .legume, macros: [
            Macro(kind: .protein, massValue: 3.3),
            Macro(kind: .fats, massValue: 1.4),
            Macro(massValue: 18.7, fiberValue: 2.0, sugarValue: 6.3),
        ])

        static let icebergLettuce = Food(name: "Iceberg Lettuce", photo: nil, category: .vegetable, macros: [
            Macro(kind: .protein, massValue: 0.9),
            Macro(kind: .fats, massValue: 0.1),
            Macro(massValue: 3.0, fiberValue: 1.2, sugarValue: 2.0),
        ])

        static let proteinWrap = Food(name: "Protein Wrap", photo: nil, category: .grain, macros: [
            Macro(kind: .protein, massValue: 16.0),
            Macro(kind: .fats, massValue: 8.0),
            Macro(massValue: 44.0, fiberValue: 35.0, sugarValue: 2.0),
        ])
    }

    enum Meals {
        static let codingDessert = Meal(
            name: "Coding Dessert",
            description: "My favorite meal of the day",
            foods: [
                LoggedFood(foodItem: Foods.cottageCheese, date: .now, massValue: 360),
                LoggedFood(foodItem: Foods.blueberries, date: .now, massValue: 500),
            ],
            time: .now
        )

        static let shreddedBreakfast = Meal(
            name: "Shredded Breakfast",
            description: "High volume, healthy fats",
            foods: [
                LoggedFood(foodItem: Foods.eggWhites, date: .now, massValue: 500),
                LoggedFood(foodItem: Foods.babySpinach, date: .now, massValue: 200),
                LoggedFood(foodItem: Foods.avocado, date: .now, massValue: 90),
            ],
            time: .now
        )

        static let powerLunch = Meal(
            name: "Chicken Wrap",
            description: "Pre-workout fuel",
            foods: [
                LoggedFood(foodItem: Foods.chickenBreast, date: .now, massValue: 200),
                LoggedFood(foodItem: Foods.proteinWrap, date: .now, massValue: 60),
                LoggedFood(foodItem: Foods.icebergLettuce, date: .now, massValue: 200),
                LoggedFood(foodItem: Foods.sweetCorn, date: .now, massValue: 100),
                LoggedFood(foodItem: Foods.cottageCheese, date: .now, massValue: 180),
            ],
            time: .now
        )
    }

    enum Events {
        static let breakfast = EatingEvent(
            name: "Breakfast",
            date: .now,
            meal: Meals.shreddedBreakfast
        )

        static let lunch = EatingEvent(
            name: "Lunch",
            date: .now,
            meal: Meals.powerLunch
        )

        static let dinner = EatingEvent(
            name: "Dinner",
            date: .now,
            meal: Meals.codingDessert
        )
    }
}
