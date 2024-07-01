//
//  ExpandSectionInitialView.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 01/07/24.
//

import SwiftUI

struct ExpandSectionInitialView: View {
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Item A")
                    Text("Item B")
                    Text("Item C")
                } header: {
                    HStack {
                        Text("Item B")
                        Spacer()
                    }
                }
                
            }
            
        }
    }
}
#Preview {
    ExpandSectionInitialView()
}
