//
//  HorizontalDeslizeViewInitial.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 15/05/24.
//

import SwiftUI

struct HorizontalDeslizeViewInitial: View {
    @State private var isShowingDetails = false

    var body: some View {
        VStack {
            Button("Mostrar Detalhes") {
                isShowingDetails.toggle()
            }
            if isShowingDetails {
                Rectangle()
                    .fill(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    HorizontalDeslizeViewInitial()
}
