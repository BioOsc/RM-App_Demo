//
//  CharacterDetail.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI
import MapKit

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
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            HStack(alignment: .center, spacing: 10, content: {
                VStack(alignment: .center, spacing: 10, content: {
                    Text("Especie: \(charVM.character?.species ?? "")")
                        .font(.title2)
                    Text("Status: \(charVM.character?.status ?? "")")
                        .font(.title2)
                })
                RMButton(title: "Ver en mapa", action: {
                    //ToDo: Go to simulated location
                }, width: 120)
            })
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(charVM.episodes) { eps in
                        RMEpisodeSheet(source: eps)
                    }
                }
                .padding(25)
            }
        })
    }
}

#Preview {
    CharacterDetail(characterID: 2)
}
