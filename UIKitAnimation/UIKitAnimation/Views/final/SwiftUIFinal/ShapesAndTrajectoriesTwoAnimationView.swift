//
//  ShapesAndTrajectoriesTwoAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct ShapesAndTrajectoriesTwoAnimationView: View {
    @State private var position = CGPoint(x: 50, y: 50)
    
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .frame(width: 50, height: 50)
            .offset(x: position.x - 25, y: position.y - 25)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.bouncy(duration: 0.5, extraBounce: 0.3)){
                            position = value.location
                        }
                    }
            )
    }
}

#Preview {
    ShapesAndTrajectoriesTwoAnimationView()
}
