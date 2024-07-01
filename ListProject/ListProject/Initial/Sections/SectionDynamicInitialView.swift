//
//  SectionDynamicInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct SectionDynamicInitialView: View {
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
            ForEach(items) { item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    SectionDynamicInitialView()
}
