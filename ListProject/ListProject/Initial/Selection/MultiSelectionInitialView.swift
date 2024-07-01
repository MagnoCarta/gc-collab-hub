//
//  MultiSelectionInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct MultiSelectionInitialView: View {
    struct Items: Identifiable {
        var id = UUID()
        let name: String
    }
    
    @State private var items: [Items] = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]
    
    
    var body: some View {
        VStack {
            List(items) {item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    MultiSelectionInitialView()
}
