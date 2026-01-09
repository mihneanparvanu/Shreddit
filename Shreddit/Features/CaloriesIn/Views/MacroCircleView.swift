//
//  MacroCircleView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/19/25.
//

import SwiftUI

struct MacroCircleView: View {
    // MARK: Dependencies

    let goal: Int
    let current: Int
    let title: String

    // MARK: State

    @State private var circleSize: CGFloat = 0

    var body: some View {
        VStack {
            ZStack {
                Graph(current: current,
                      goal: goal)
                    .stroke(style: .init(lineWidth: 8,
                                         lineCap: .square))
                    .foregroundStyle(accentColor)
                    .frame(size: circleSize * 0.98)

                VStack {
                    Text(current.formatted(.number))
                        .font(.title2.weight(.semibold))
                        .foregroundStyle(accentColor)
                }
                .padding(40)
                .background {
                    GeometryReader { geo in
                        Color(.systemGray6)
                            .onAppear {
                                circleSize = geo.size.height
                            }
                    }
                }
                .clipShape(.circle)
            }
            Text(title)
                .font(.callout.weight(.medium))
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: Colors

extension MacroCircleView {
    private var accentColor: Color {
        DesignConstants.Colors.Brand.primary
    }
}

extension MacroCircleView {
    struct Graph: Shape {
        // MARK: Dependencies

        let current: Int
        let goal: Int

        func path(in rect: CGRect) -> Path {
            let startAngle: Angle = .degrees(150)
            let angleRange: Angle = .degrees(240)

            var endAngle: Angle {
                // Calculate progress and clamp it to 1
                let progress = min(Double(current) / Double(goal), 1)

                // End angle is start angle + the total angle to fill * the progress
                return startAngle + (angleRange * progress)
            }

            var path = Path()
            path.addArc(
                center: CGPoint(x: rect.midX,
                                y: rect.midY),
                radius: rect.width / 2,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: false
            )
            return path
        }
    }

    struct CircleView: View {
        var body: some View {}
    }
}

#Preview {
    MacroCircleView(goal: 230,
                    current: 230,
                    title: "Protein")
}
