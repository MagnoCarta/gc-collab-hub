//
//  ContentView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 16/05/24.
//

import SwiftUI


struct ContentView: View {
//    struct Items: Hashable, Comparable,Identifiable {
//        var id: String { name }
//        
//        static func < (lhs: ContentView.Items, rhs: ContentView.Items) -> Bool {
//            lhs.name < rhs.name
//        }
//        
//        let name: String
//    }
    struct Items: Identifiable {
        var id: String { name }
        let name: String
    }
//    
//    let items: Set<Items> = [
//        .init(name: "Item A"),
//        .init(name: "Item B"),
//        .init(name: "Item C"),
//    ]
    let items: Array<Items> = [
        .init(name: "Item A"),
        .init(name: "Item B"),
        .init(name: "Item C"),
    ]

    var body: some View {
        List {
            Section("Items") {
//                ForEach(items.sorted(by:<)) { item in
                ForEach(items) { item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
