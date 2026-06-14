//
//  CharactersList.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct CharactersList: View {
    
    @State var search: String
    @State var current: Int
    
    @StateObject private var charVM: CharacterViewModel = CharacterViewModel()
    
    init() {
        self.search = ""
        self.current = 1
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            RMSearchBar(title: "Search By", text: search, onChange: { text in
                if (text.count > 4 ) {
                    //ToDo: Call search api (current not work as an autocomplete search) and avoid implementation high network usage
                }
            }, placeholder: "<Nombre, especie o estado>")
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(charVM.characters) { char in
                        NavigationLink(destination: CharacterDetail(characterID: char.id)) {
                            RMCharSheet(source: char)
                        }
                    }
                }
                .padding(25)
                .onAppear(perform: {
                    charVM.getBy(page: current)
                })
            }
            HStack(alignment: .center, spacing: 10, content: {
                RMButton(title: "Prev", action: {
                    if (current > 1) {
                        current = current - 1
                        charVM.getBy(page: current)
                    }
                }, height: 50, width: 70)
                Text("Pg\(current)")
                    .font(.headline)
                RMButton(title: "Next", action: {
                    current = current + 1
                    charVM.getBy(page: current)
                }, height: 50, width: 70)
            })
        })
    }
    
}

#Preview {
    CharactersList()
}
