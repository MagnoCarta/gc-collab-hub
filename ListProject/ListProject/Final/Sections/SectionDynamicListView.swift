//
//  DynamicListForeachView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 28/06/24.
//

import SwiftUI

struct SectionDynamicListView: View {
    struct Item: Identifiable {
            var id: String { name }
            let name: String
        }

        let items: Array<Item> = [
            .init(name: "Item A"),
            .init(name: "Item B"),
            .init(name: "Item C"),
        ]

        var body: some View {
            List {
                Section("Items") {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                }
            }
        }
}

#Preview {
    SectionDynamicListView()
}
