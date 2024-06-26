//
//  simpleAnimationSlideView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 26/06/24.
//

import SwiftUI

struct simpleAnimationSlideView: View {
    @State private var isAnimated = false
    
    var body: some View {
        VStack {
            Circle()
                .frame(
                    width: isAnimated ? 100 : 50,
                    height: isAnimated ? 100 : 50
                )
                .animation(.easeInOut, value: isAnimated)
                .onTapGesture {
                    isAnimated.toggle()
                }
        }
    }
}

#Preview {
    simpleAnimationSlideView()
}
