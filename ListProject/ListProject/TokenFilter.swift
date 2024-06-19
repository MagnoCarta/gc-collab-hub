//
//  TokenFilter.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 13/06/24.
//

import SwiftUI

struct TokenFilter: View {
    @State private var searchText = ""
    @State private var selectedTokens: [String] = []
    @State private var items = [
        "Apple - Fruit", "Banana - Fruit", "Cherry - Fruit",
        "Date - Fruit", "Fig - Fruit", "Grape - Fruit",
        "Carrot - Vegetable", "Broccoli - Vegetable"
    ]

    var filteredItems: [String] {
        if searchText.isEmpty && selectedTokens.isEmpty {
            return items
        } else {
            return items.filter { item in
                (searchText.isEmpty || item.contains(searchText)) &&
                (selectedTokens.isEmpty || selectedTokens.allSatisfy { item.contains($0) })
            }
        }
    }

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            ScrollView(.horizontal) {
                HStack {
                    ForEach(["Fruit", "Vegetable"], id: \.self) { token in
                        Button(action: {
                            if selectedTokens.contains(token) {
                                selectedTokens.removeAll { $0 == token }
                            } else {
                                selectedTokens.append(token)
                            }
                        }) {
                            Text(token)
                                .padding()
                                .background(selectedTokens.contains(token) ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }

            List(filteredItems, id: \.self) { item in
                Text(item)
            }
        }
        .padding()
    }
}

#Preview {
    TokenFilter()
}
