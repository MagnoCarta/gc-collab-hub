//
//  StaticListView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct StaticListView: View {
    var body: some View {
        List {
            Text("Item A")
            Text("Item B")
            Text("Item C")
        }
    }
}

#Preview {
    StaticListView()
}
