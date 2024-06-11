//
//  StateSlideAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 14/05/24.
//

import SwiftUI

struct StateSlideAnimationView: View {
    @State private var sliderValue: Double = 0.5

        var body: some View {
            VStack {
                Slider(value: $sliderValue)
                    .padding()
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(CGFloat(sliderValue))
//                    .animation(.spring(), value: sliderValue)
            }
        }
}

#Preview {
    StateSlideAnimationView()
}
