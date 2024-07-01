//
//  SimpleFilterInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct SimpleFilterInitialView: View {
    
    private var items: [String] = ["Alice in Chains", "Beatles", "Foo fighters", "Legião Urbana", "Kid Abelha", "Elvis Presley", "Deftones", "Guns N' Roses", "Metallica", "Black Sabbath", "Judas Priest", "Imagine Dragons", "AJR", "Neck deep", "Motorhead", "Avenged Sevenfold"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    SimpleFilterInitialView()
}
