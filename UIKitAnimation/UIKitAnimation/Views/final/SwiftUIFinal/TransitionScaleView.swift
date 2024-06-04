//
//  TransitionScaleView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 13/05/24.
//

import SwiftUI

struct TransitionScaleView: View {
    @State private var isScaled = true
    var scale: CGFloat {
        isScaled ? 2 : 0.5
    }
    
    var body: some View {
        VStack {
            Button("Alternar Escala") {
                withAnimation() {
                    isScaled.toggle()
                }
            }
            if isScaled {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
                    .transition(.scale(scale: scale, anchor: .center))
            }else {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                    .transition(.scale(scale: scale, anchor: .center))
            }
            
        }
    }
}

#Preview {
    TransitionScaleView()
}
