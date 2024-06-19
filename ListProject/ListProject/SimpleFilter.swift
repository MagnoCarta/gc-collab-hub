//
//  SimpleFilter.swift
//  ListProject
//
//  Created by Caio de Almeida Pessoa on 13/06/24.
//

import SwiftUI

struct SimpleFilter: View {
    struct Token: Identifiable {
        var name: String
        var id: String {  name }
        
    }
    
    private var items: [String] = ["Alice in Chains", "Beatles", "Foo fighters", "Legião Urbana", "Kid Abelha", "Elvis Presley", "Deftones", "Guns N' Roses", "Metallica"]
    
    @State private var searchText = ""
    
    @State private var newToken: Token = Token(name: "")
    @State private var allTokens: [Token] = [Token(name: "primeiro")]
    
    private var currentTokens: [Token] {
        if searchText.starts(with: "#") {
            newToken.name = searchText
            allTokens.append(newToken)
            //            print("Entrou")
            //            if searchText.hasSuffix("fim") {
            //                print("Fim")
            //                allTokens.append(Token(name: searchText))
            //                searchText = ""
            //                print("FIM @")
            //            }
            //            return allTokens
            return allTokens
        } else {
            return[]
        }
    }
    
    //    @State var allTokens = {
    //        var items: [String] = ["Alice in Chains", "Beatles", "Foo fighters", "Legião Urbana", "Kid Abelha", "Elvis Presley", "Deftones", "Guns N' Roses", "Metallica"]
    //        var all: [Token] = []
    //        items.forEach { item in
    //            all.append(Token(name: item))
    //        }
    //        return all
    //
    //    }()
    
    //    var sugestedTokens: [Token] {
    //        if searchText.starts(with: "#") {
    //            currentTokens.append(Token(name: "Caio"))
    //            return allTokens
    //        } else {
    //            return []
    //        }
    //    }
    
    private var filteredItems: [String] {
        items.filter({
            if !searchText.isEmpty {
                $0.localizedCaseInsensitiveContains(searchText)
            } else { true }
        })
    }
    
    var cT = [Token(name: "A")]
    
    var tokensSelected: [Token] {
        if searchText.hasPrefix("#") {
            if searchText.hasSuffix(" ") {
//                cT.append(Token(name: searchText)) 98
                searchText = ""
            }
        }
        return cT
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(allTokens.last!.name)
                List(filteredItems, id: \.self) { item in
                    Text(item)
                }
            }
            //            .searchable(text: $searchText, tokens: $currentTokens, suggestedTokens: .constant(sugestedTokens), token: { element in
            //                                Text(element.name)
            //            })
            //            .searchable(
            //                text: $searchText,
            //                tokens: $allTokens,
            //                prompt: Text("Type to filter, or use # for tags"),
            //                token: { element in
            //                    Text(element.name)
            //                })
            //            .searchSuggestions {
            //                Text(" primeiro")
            //            }
            //            .searchable(text: $searchText, editableTokens: $allTokens, isPresented: .constant(true)) { token in
            //                Text("Caio")
            //            }
            .searchable(
                text: $searchText,
                tokens: .constant(tokensSelected)
            ) { token in
                Text(token.name)
            }
        }
    }
}

#Preview {
    SimpleFilter()
}


