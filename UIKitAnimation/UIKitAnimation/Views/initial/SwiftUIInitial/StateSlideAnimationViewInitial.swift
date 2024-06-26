//
//  StateSlideAnimationViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 11/06/24.
//

import SwiftUI

struct StateSlideAnimationViewInitial: View {
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue)
                .padding()
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(CGFloat(sliderValue))
        }
    }
}

#Preview {
    StateSlideAnimationViewInitial()
}
