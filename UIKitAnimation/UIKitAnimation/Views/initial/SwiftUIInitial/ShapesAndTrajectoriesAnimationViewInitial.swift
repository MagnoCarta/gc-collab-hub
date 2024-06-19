//
//  ShapesAndTrajectoriesAnimationViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct ShapesAndTrajectoriesAnimationViewInitial: View {
    @State private var isAnimating = false

    var body: some View {
        RoundedRectangle(cornerRadius: isAnimating ? 50 : 10)
            .foregroundColor(.blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                isAnimating.toggle()
            }
    }
}

#Preview {
    ShapesAndTrajectoriesAnimationViewInitial()
}
