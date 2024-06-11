//
//  StateAnimationViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 11/06/24.
//

import SwiftUI

struct StateAnimationViewInitial: View {
    @State private var isToggled = false
    
    var body: some View {
        VStack {
            Toggle("Alterar Estado", isOn: $isToggled)
                .padding()
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(isToggled ? .green : .red)
                .frame(width: 200, height: 200)
//                .animation(.easeInOut(duration: 0.5), value: isToggled)
        }
    }
}

#Preview {
    StateAnimationViewInitial()
}
