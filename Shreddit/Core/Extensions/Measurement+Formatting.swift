//
//  Measurement+Formatting.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/10/26.
//

import Foundation

extension Measurement where UnitType: Dimension {
    var valueUnitDisplay: String {
        formatted(.measurement(width: .abbreviated,
                               usage: .asProvided,
                               numberFormatStyle: .number
                                   .precision(.fractionLength(0))))
    }
}
