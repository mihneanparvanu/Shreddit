//
//  Macro+Reducer.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 4/12/26.
//

import Foundation

extension Sequence where Element == Macro {
	func reduced() -> [Macro]{
		let dictionary = self.reduce(
			into: [Macro.Kind:Macro]()
		){ accumulator, macro in

			if let existing = accumulator[macro.kind] {
				accumulator[macro.kind] = macro.combined(with: existing)
			} else {
				accumulator[macro.kind] = macro
			}
		}
		return Array(dictionary.values)
	}}
