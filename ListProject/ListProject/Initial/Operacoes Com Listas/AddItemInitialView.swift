//
//  AddItemInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct AddItemInitialView: View {
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
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            VStack {
                List(selection: $multiSelection) {
                    ForEach(items) {
                        Text($0.name)
                    }
                }
                
                Text("\(multiSelection.count) selections")
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Items")
            .environment(\.editMode, $editMode)
        }
    }
}

#Preview {
    AddItemInitialView()
}
