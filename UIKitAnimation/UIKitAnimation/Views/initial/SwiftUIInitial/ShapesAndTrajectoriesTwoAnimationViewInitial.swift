//
//  ShapesAndTrajectoriesTwoAnimationViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct ShapesAndTrajectoriesTwoAnimationViewInitial: View {
    @State private var position = CGPoint(x: 50, y: 50)
    
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .frame(width: 50, height: 50)
            .offset(x: position.x - 25, y: position.y - 25)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.location
                    }
            )
    }
}

#Preview {
    ShapesAndTrajectoriesTwoAnimationViewInitial()
}
