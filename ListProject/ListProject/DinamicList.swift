//
//  DinamicList.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 21/05/24.
//

import SwiftUI

struct DinamicList: View {
    struct Items: Identifiable {
        var id: String { name }
        let name: String
    }
    
    let items: Array<Items> = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    var body: some View {
        List(items) {
            Text($0.name)
        }
    }
}

#Preview {
    DinamicList()
}
