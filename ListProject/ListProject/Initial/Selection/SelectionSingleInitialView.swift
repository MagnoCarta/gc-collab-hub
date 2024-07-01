//
//  SelectionSingleInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct SelectionSingleInitialView: View {
    struct Items: Identifiable {
        var id = UUID()
        let name: String
    }
    
    let items: Array<Items> = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    var body: some View {
        List(items) {item in
            Text(item.name)
        }
    }
}

#Preview {
    SelectionSingleInitialView()
}
