//
//  SectionStaticListView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct SectionStaticListView: View {
    var body: some View {
        List {
            Section("Title") {
                Text("Item A")
            }
            Section {
                Text("Item B")
            }
            Section{
                Text("Item C")
            }
            Section {
                Text("Item D")
            } footer: {
                Text("Footer")
            }
        }
    }
}

#Preview {
    SectionStaticListView()
}
