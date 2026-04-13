//
//  MacroView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/19/25.
//

import SwiftUI

struct MacroView: View {
    // MARK: Dependencies

    let macro: Macro

    @Environment(\.macroViewStyle) var style

    init(
        _ macro: Macro
    ) {
        self.macro = macro
    }

    var body: some View {
        VStack(spacing: Design.space.m) {
            ZStack {
                Graph(progress: progress, size: style.size.cgValue)

                VStack {
                    Text(
                        macro.kind.title.first?.uppercased() ?? ""
                    )
                    .font(style.size.font)
                    if style.variant == .detailed {
                        Text(macro.mass.valueUnitDisplay)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

extension MacroView {
    enum Variant {
        case detailed, compact
    }

    enum Size {
        case small, medium
        var cgValue: CGFloat {
            switch self {
            case .small: 28
            case .medium: Design.size.m
            }
        }

        var font: Font {
            switch self {
            case .small: .footnote
            case .medium: .headline
            }
        }
    }
}

private extension MacroView {
    var progress: Double {
        let currentValue = Double(macro.mass.value)
        let goal = Double(100)
        return min(currentValue / goal, 1)
    }

    struct Graph: View {
        let progress: Double
        let size: CGFloat
        let accentColor: Color = .green

        @Environment(\.theme) var theme

        var body: some View {
            ZStack {
                ZStack {
                    Circle()
                        .foregroundStyle(Color(.systemGray5))

                    Path { path in
                        let center = CGPoint(x: size / 2, y: size / 2)
                        path.move(to: center)
                        path
                            .addArc(
                                center: center,
                                radius: size / 2,
                                startAngle: .degrees(270),
                                endAngle: .degrees(270 - (-360 * progress)),
                                clockwise: false
                            )
                    }

                    .foregroundStyle(accentColor)
                }
                .frame(width: size, height: size)
                .scaleEffect(1.11)

                Circle()
                    .frame(width: size, height: size)
                    .foregroundStyle(.background)
            }
        }

        var circleColor: Color {
            progress == 1 ? accentColor : Color(.systemGray3)
        }
    }
}

#Preview {
    MacroView(.init(kind: .protein, massValue: 80))
        .macroStyle(size: .medium, variant: .detailed)
}
