//
//  ContentView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 09/05/24.
//

import SwiftUI

struct HorizontalDeslizeView: View {
    @State private var isShowingDetails = false

    var body: some View {
        VStack {
            Button("Mostrar Detalhes") {
                withAnimation {
                    isShowingDetails.toggle()
                }
            }
            if isShowingDetails {
                Rectangle()
                    .fill(.blue)
                    .transition(.slide)
            }
        }
        .padding()
    }
}

#Preview {
    HorizontalDeslizeView()
}
