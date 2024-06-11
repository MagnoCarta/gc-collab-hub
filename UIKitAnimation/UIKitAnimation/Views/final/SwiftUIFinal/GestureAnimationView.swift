//
//  GestureAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 11/06/24.
//

import SwiftUI

struct GestureAnimationView: View {
    @State private var isDragging = false
    @State private var offset = CGSize.zero

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                withAnimation {
                    offset = value.translation
                    isDragging = true
                }
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(isDragging ? .blue : .gray)
            .frame(width: 200, height: 200)
            .offset(offset)
            .gesture(dragGesture)
    }
}

#Preview {
    GestureAnimationView()
}
