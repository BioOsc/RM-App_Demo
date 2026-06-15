//
//  FavoriteCharacter.swift
//  RMAppDemo
//
//  Created by BioOsc on 14/06/26.
//

import SwiftUI

struct FavoriteCharacter: View {
    
    @StateObject private var charVM: FavoriteCharViewModel = FavoriteCharViewModel()
    
    var body: some View {
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
                charVM.getMemory()
            })
        }
    }
}

#Preview {
    FavoriteCharacter()
}
