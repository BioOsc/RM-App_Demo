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
    
    @State private var favorite: Bool
    @State private var charVM: CharDetailViewModel
    
    init(characterID: Int) {
        self.characterID = characterID
        charVM = CharDetailViewModel(id: characterID)
        favorite = MemoryManager.shared.characterIsFavorite(ref: characterID)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Text(charVM.character?.name ?? "")
                .font(.largeTitle)
            ZStack(alignment: .topLeading, content: {
                AsyncImage(url: URL(string: charVM.character?.image ?? "")) { image in
                    image.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                }
                if (favorite) {
                    Image(.star)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.yellow)
                        .frame(width: 30, height: 30)
                }
            })
            HStack(alignment: .center, spacing: 10, content: {
                VStack(alignment: .center, spacing: 10, content: {
                    Text("Especie: \(charVM.character?.species ?? "")")
                        .font(.title2)
                    Text("Status: \(charVM.character?.status ?? "")")
                        .font(.title2)
                })
                VStack(alignment: .center, spacing: 10, content: {
                    RMButton(title: "Ver en mapa", action: {
                        //ToDo: Go to simulated location
                    }, width: 120)
                    RMButton(title: "Favorito", action: {
                        if (favorite) {
                            MemoryManager.shared.removeFavorite(ref: characterID)
                            favorite = false
                            MemoryManager.shared.deleteFavCharacter(char: characterID)
                        } else {
                            favorite = MemoryManager.shared.setFavorite(ref: characterID)
                            if (favorite && charVM.character != nil) {
                                MemoryManager.shared.saveFavCharacter(char: charVM.character!)
                            }
                        }
                    }, width: 100)
                })
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
