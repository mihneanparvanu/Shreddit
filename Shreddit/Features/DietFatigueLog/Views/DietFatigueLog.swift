//
//  DietFatigueLog.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 7/22/25.
//

import SwiftUI

struct DietFatigueLog: View {
	@State var fatigueState: DietFatigueState? = .noFatigue
	
	@Environment(\.designSystem) var design
	var body: some View {
		VStack{
		
			VStack {
				Text("How is your diet fatigue?")
					.font(.title.weight(.semibold))
					.foregroundStyle(design.colors.content.heading)
				Text (fatigueState?.description ?? "")
					.font(.callout)
					.foregroundStyle(design.colors.content.description)
			}
			
			EmojiView(selectedEmoji: $fatigueState)
		}
		.infinityFrame(.height)
		.background(design.colors.surface.secondary)
	}
}

extension DietFatigueLog {
	struct EmojiView: View {
		@Binding var selectedEmoji: DietFatigueState?
		var body: some View {
			ScrollView(.horizontal, showsIndicators: false){
				HStack (spacing: 0) {
					ForEach(DietFatigueState.allCases){ state in
						Text (state.emoji)
							.frame(width: 125)
							.font(.system(size: 100))
							.rotation3DEffect(
								calculateEffects(for: state,
												 selectedEmoji: selectedEmoji).rotation,
								axis: (x: 0, y: 0, z: 1)
							)
							.opacity(
								calculateEffects(
									for: state,
									selectedEmoji: selectedEmoji
								).opacity
							)
							.scaleEffect(
								calculateEffects(
									for: state,
									selectedEmoji: selectedEmoji
								).scale
							)
							.offset(y: calculateEffects(for: state,
														selectedEmoji: selectedEmoji).offsetY)
					}
				}
				.scrollTargetLayout()
				.infinityFrame(.height)
			}
			.scrollTargetBehavior(.viewAligned)
			.scrollPosition(id: $selectedEmoji, anchor: .center)
		}
		
		
		private func calculateEffects(for currentEmoji: DietFatigueState, selectedEmoji: DietFatigueState?) -> (rotation: Angle, opacity: CGFloat, scale: CGFloat, offsetY: CGFloat) {
		
			// Early exit
			guard let selectedEmoji = selectedEmoji, selectedEmoji != currentEmoji else {
				return (.degrees(0), 1, 1, 0)
			}
		
			// Calculate the distance from the current emoji
			let distance = Double(selectedEmoji.index.distance(to: currentEmoji.index))
			// Calculate the rotation based on the distance with the signed value
			let rotation = Angle(degrees: distance * 20)
			let offsetY = CGFloat(abs(distance) * 30)
			
			let maxDistance = 2.0
		
			
			let percentage = 1.0 - min(abs(distance) / maxDistance, 1)
			
			let opacity = 0.7 + CGFloat(percentage * 0.3)
			let scale = 0.7 + CGFloat(percentage * 0.3)
			
			
			return (rotation, opacity, scale, offsetY)
		}
	}
}


#Preview {
	DietFatigueLog()
}

enum DietFatigueState: CaseIterable, Identifiable {
	
	case noFatigue
	case minFatigue
	case mildFatigue
	case highFatigue
	case extremeFatigue
	
	var id: Self {
		self
	}
	
	var index: Int {
		Self.allCases.firstIndex(of: self)!
	}
	
	var description: String {
		switch self {
			case .noFatigue:
				return "I'm all good"
			case .minFatigue:
				return "I'm a bit hungry"
			case .mildFatigue:
				return "I'm hungry and tired"
			case .highFatigue:
				return "I feel like every day is a chore."
			case .extremeFatigue:
				return "I'd rather die than do this anymore!"
		}
	}
	
	var emoji: String {
		switch self {
			case .noFatigue:
				return "😄"
			case .minFatigue:
				return "😅"
			case .mildFatigue:
				return "😬"
			case .highFatigue:
				return "😣"
			case .extremeFatigue:
				return "😫"
		}
	}
}
