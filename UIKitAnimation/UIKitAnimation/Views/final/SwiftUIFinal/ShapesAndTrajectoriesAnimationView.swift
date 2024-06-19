//
//  ShapesAndTrajectoriesAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct ShapesAndTrajectoriesAnimationView: View {
    @State private var isAnimating = false

    var body: some View {
        RoundedRectangle(cornerRadius: isAnimating ? 50 : 10)
            .foregroundColor(.blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isAnimating.toggle()
                }
            }
    }
}

#Preview {
    ShapesAndTrajectoriesAnimationView()
}
