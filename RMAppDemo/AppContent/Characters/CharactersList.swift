//
//  CharactersList.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct CharactersList: View {
    
    @State var search: String
    
    @StateObject private var charVM = CharacterViewModel()
    
    init() {
        self.search = ""
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            RMSearchBar(title: "Search By", text: search, onChange: { text in
                if (text.count > 4 ) {
                    //ToDo: call search api (current not work as coincidental search) and implementation cost high network usage
                }
            }, placeholder: "<Nombre, especie o estado>")
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(charVM.characters) { char in
                        RMCharSheet(source: char)
                    }
                }
                .padding(25)
            }
        })
    }
}

#Preview {
    CharactersList()
}
