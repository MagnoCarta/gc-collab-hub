//
//  DynamicListInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct DynamicListInitialView: View {
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
        EmptyView()
    }
}

#Preview {
    DynamicListInitialView()
}
