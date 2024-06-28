//
//  SimpleFilter.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 13/06/24.
//

import SwiftUI

struct SimpleFilter: View {
    
    private var items: [String] = ["Alice in Chains", "Beatles", "Foo fighters", "Legião Urbana", "Kid Abelha", "Elvis Presley", "Deftones", "Guns N' Roses", "Metallica", "Black Sabbath", "Judas Priest"]
    
    @State private var searchText = ""
    
    
    private var filteredItems: [String] {
        items.filter({
            if !searchText.isEmpty {
                $0.localizedCaseInsensitiveContains(searchText)
            } else { true }
        })
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(filteredItems, id: \.self) { item in
                    Text(item)
                }
            }
        }
        .searchable(
            text: $searchText
        )
    }
}

#Preview {
    SimpleFilter()
}


