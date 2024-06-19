//
//  EffectsAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct EffectsAnimationView: View {
    @State private var isRotated = false
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 150, height: 100)
            .rotationEffect(.degrees(isRotated ? 90 : 0))
            .onTapGesture {
                withAnimation(.spring(Spring(duration: 1, bounce: 0.5 ))) {
                    isRotated.toggle()
                }
            }
    }
}

#Preview {
    EffectsAnimationView()
}
