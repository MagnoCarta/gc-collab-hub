//
//  FinalAnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 19/06/24.
//

import SwiftUI

struct FinalAnimationView: View {
    @Namespace private var animation
    @State private var isZoomed = false

    var frame: Double {
        isZoomed ? 300 : 44
    }

    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)

                    if isZoomed == false {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation) // Isso é interessante
                            .font(.headline)
                        Spacer()
                    }
                }

                if isZoomed == true {
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(Color(white: 0.9))
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    FinalAnimationView()
}
