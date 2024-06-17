//
//  GestureAnimationViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 14/06/24.
//

import SwiftUI

struct GestureAnimationViewInitial: View {
    @State private var isDragging = false
    @State private var offset = CGSize.zero
    
    var body: some View {
//        let dragGesture = DragGesture()
//            .onChanged { value in
//                offset = value.translation
//                isDragging = true
//            }
//            .onEnded { _ in
//                offset = .zero
//                isDragging = false
//            }
        
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(isDragging ? .blue : .gray)
            .frame(width: 200, height: 200)
            .offset(offset)
//            .gesture(dragGesture)
    }
}

#Preview {
    GestureAnimationViewInitial()
}
