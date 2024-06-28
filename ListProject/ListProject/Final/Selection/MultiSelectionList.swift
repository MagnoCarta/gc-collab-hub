//
//  MultiSelectionList.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 27/05/24.
//

import SwiftUI

struct MultiSelectionList: View {
    struct Items: Identifiable {
        var id = UUID()
        let name: String
    }
    
    @State private var items: [Items] = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    
    @State private var multiSelection: Set<UUID> = .init()
    
    var body: some View {
        NavigationView {
            VStack {
                List(items, selection: $multiSelection) {item in
                    Text(item.name)
                }
                
                Text("\(multiSelection.count) selections")
                Spacer()
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Items")
        }
    }
}

#Preview {
    MultiSelectionList()
}
