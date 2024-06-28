//
//  SelectionListSection.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 23/05/24.
//

import SwiftUI

struct Items: Identifiable, Hashable {
    var id: String { name }
    let name: String
}

let items: [Items] = [
    .init(name: "Item A"),
    .init(name: "Item B"),
    .init(name: "Item C"),
]


struct SelectionListSection: View {
    @State private var selectedItems: Set<Items> = []

        var body: some View {
            List {
                Section(header: Text("Items")) {
                    ForEach(items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            if selectedItems.contains(item) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())  // Make the entire row tappable
                        .onTapGesture {
                            if selectedItems.contains(item) {
                                selectedItems.remove(item)
                            } else {
                                selectedItems.insert(item)
                            }
                        }
                    }
                }
            }
        }
}

#Preview {
    SelectionListSection()
}
