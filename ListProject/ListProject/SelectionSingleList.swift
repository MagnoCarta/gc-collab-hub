//
//  SelectionSingleList.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 23/05/24.
//

import SwiftUI

struct SelectionSingleList: View {
    struct Items: Identifiable {
        var id = UUID()
        let name: String
    }
    
    let items: Array<Items> = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    @State private var uuidSelected: UUID? = nil
    @State private var itemSelected: Items?
    
    var body: some View {
        List(items, selection: $uuidSelected) {item in
            Text(item.name)
        }
//        if( itemSelected != nil){
//            Text("\(itemSelected!.name) Selected")
//        }
//        Button(action: {
//            itemSelected = items.first { item in
//                    item.id == Selection
//                }
//        }, label: {
//            Text("Submit")
//        })
    }
}

#Preview {
    SelectionSingleList()
}
