//
//  styleList.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 10/06/24.
//

import SwiftUI

struct StyleList: View {
    struct Items: Identifiable {
        var id = UUID()
        var name: String
    }
    
    @State private var items: [Items] = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    @State private var multiSelection: Set<UUID> = .init()
    @State private var newItemName: String = ""
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            VStack {
                List(selection: $multiSelection){
                    ForEach($items) { $item in
                        
                        if editMode.isEditing {
                            TextField(text: $item.name) {
                            }
                        } else {
                            Text(item.name)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        items.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .listRowBackground(Color.gray)
//                    .listRowSeparator(.hidden)
                    .listRowSeparatorTint(.red)
//                    .listRowSpacing(200.0)
//                    .listRowInsets(.init(top: 10, leading: 100, bottom: 10, trailing: 10))
//                    .listRowInsets(.init(top: <#T##CGFloat#>, leading: <#T##CGFloat#>, bottom: <#T##CGFloat#>, trailing: <#T##CGFloat#>))
                }
                
                Text("\(multiSelection.count) selections")
//                ["adsjuihsic"].filter {
//                    "A".localizedCaseInsensitiveContains($0)
//                }
                    .padding()
                
                if editMode.isEditing {
                    HStack {
                        TextField("New Item", text: $newItemName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        Button(action: {
                            addItem()
                        }) {
                            Text("Add")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.trailing)
                    }
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .push(from: .bottom),
                            removal: .push(from: .top)
                        )
                    )
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if editMode.isEditing {
                        Button(action: {
                            deleteItems()
                        }) {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            
            .navigationTitle("Items")
            .environment(\.editMode, $editMode)
        }
    }
    
    private func addItem() {
        guard !newItemName.isEmpty else { return }
        let newItem = Items(name: newItemName)
        items.append(newItem)
        newItemName = ""
    }
    
    private func deleteItems() {
        items.removeAll { item in
            multiSelection.contains(item.id)
        }
        multiSelection.removeAll()
    }
}

#Preview {
    StyleList()
}
