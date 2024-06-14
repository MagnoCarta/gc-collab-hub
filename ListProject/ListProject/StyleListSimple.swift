//
//  StyleListSimple.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 12/06/24.
//

import SwiftUI

struct StyleListSimple: View {
    var body: some View {
        VStack {
            List {
                Text("Item A")
                    .listRowSeparatorTint(.green)
                    .listRowBackground(Color(.systemGray4))
                Text("Item B")
                    .listRowSeparatorTint(.red)
                    .listRowBackground(Color(.systemGray5))
                Text("Item C")
                    .listRowSeparatorTint(.green)
                    .listRowBackground(Color(.systemGray4))
                Text("Item D")
                    .listRowSeparator(.visible)// Por padrão o último item tem o separator hidden
                    .listRowSeparatorTint(.red)
                    .listRowBackground(Color(.systemGray5))
            }
        }
    }
}

#Preview {
    StyleListSimple()
}
