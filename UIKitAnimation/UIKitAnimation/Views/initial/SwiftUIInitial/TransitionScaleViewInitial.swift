//
//  TransitionScaleViewInitial.swift
//  UIKitAnimation
//
//  Created by Pedro IOSI on 15/05/24.
//

import SwiftUI

struct TransitionScaleViewInitial: View {
    @State private var isScaled = true
    
    var scale: Double {
        isScaled ?  2 : 0.5
    }
    
    var body: some View {
        VStack {
            Button("Alternar Escala") {
                isScaled.toggle()
            }
            if isScaled {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
            }else {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
            }
            
        }
    }
}

#Preview {
    TransitionScaleViewInitial()
}
