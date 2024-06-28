//
//  SelectionList.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 23/05/24.
//

import SwiftUI

struct SelectionList: View {
    struct Items: Identifiable {
        var id = UUID()
        let name: String
    }
    
    let items: Array<Items> = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(items, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Items")
            .toolbar {
                EditButton()
            }
        }
        Text("\(multiSelection.count) selections")
    }
}

#Preview {
    SelectionList()
}
