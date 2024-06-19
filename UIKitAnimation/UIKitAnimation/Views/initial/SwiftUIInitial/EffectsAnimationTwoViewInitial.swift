//
//  EffectsAnimationTwoViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct EffectsAnimationTwoViewInitial: View {
    @State private var isScaled = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .frame(width: 100, height:  100)
            .scaleEffect(isScaled ? 3.6 : 1)
            .onTapGesture {
                isScaled.toggle()
            }
    }
}

#Preview {
    EffectsAnimationTwoViewInitial()
}
