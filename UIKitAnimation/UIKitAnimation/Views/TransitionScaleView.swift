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
        isScaled ? 2 : 1
    }

        var body: some View {
            VStack {
                Button("Alternar Escala") {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
                            withAnimation() {
                                isScaled.toggle()
                            }
                        })
                }
                .padding(.bottom, 120)
    
            }
            .overlay {
                if isScaled {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 50))
                        .transition(.scale(scale: scale))
                }
            }
        }
}

#Preview {
    TransitionScaleView()
}
