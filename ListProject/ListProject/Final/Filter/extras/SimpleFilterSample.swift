//
//  SwiftUIView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 13/06/24.
//

import SwiftUI

struct SimpleFilterSample: View {
    private var items: [String] = ["Alice in Chains", "Beatles", "Foo fighters", "Legião Urbana", "Kid Abelha", "Elvis Presley", "Deftones", "Guns N' Roses", "Metallica"]
    
    var body: some View {
        VStack {
            List(items, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    SimpleFilterSample()
}
