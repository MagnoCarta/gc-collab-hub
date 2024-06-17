//
//  GestureLongPressAnimationViewFinal.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 14/06/24.
//

import SwiftUI

struct GestureLongPressAnimationViewFinal: View {
    @State private var isTapped = false

    var body: some View {
        Circle()
            .foregroundColor(isTapped ? .red : .blue)
            .frame(width: 100, height: 100)
            .gesture(
                LongPressGesture(minimumDuration: 2)
                    .onChanged { _ in
                        isTapped.toggle()
                        // Fazer outra coisa
                    }
                    .onEnded { _ in
                        isTapped.toggle()
                    }
            )
    }
}

#Preview {
    GestureLongPressAnimationViewFinal()
}
