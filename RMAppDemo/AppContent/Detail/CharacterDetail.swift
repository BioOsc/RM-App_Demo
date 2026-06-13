//
//  CharacterDetail.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct CharacterDetail: View {
    
    var characterID: Int
    
    @State private var charVM: CharDetailViewModel
    
    init(characterID: Int) {
        self.characterID = characterID
        charVM = CharDetailViewModel(id: characterID)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Text(charVM.character?.name ?? "")
                .font(.largeTitle)
            AsyncImage(url: URL(string: charVM.character?.image ?? "")) { image in
                image.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            Text("Especie: \(charVM.character?.species)")
                .font(.title3)
            Text("Status: \(charVM.character?.status)")
                .font(.title3)
        })
    }
}

#Preview {
    CharacterDetail(characterID: 2)
}
