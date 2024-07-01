//
//  ExpandSectionView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 28/06/24.
//

import SwiftUI

struct ExpandSectionView: View {
    @State var sectionIsExpanded: Bool = true
    
    var body: some View {
        VStack {
            List {
                Section(isExpanded: $sectionIsExpanded) {
                    Text("Item A")
                    Text("Item B")
                    Text("Item C")
                } header: {
                    HStack {
                        Text("Header")
                        Spacer()
                        Button(sectionIsExpanded ? "Colapsar" : "Expandir") {
                            sectionIsExpanded.toggle()
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ExpandSectionView()
}
