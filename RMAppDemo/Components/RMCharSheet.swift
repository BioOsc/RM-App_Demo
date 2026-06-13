//
//  RMCharSheet.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct RMCharSheet: View {
    
    var content: RMCharacter
    
    init(source: RMCharacter) {
        self.content = source
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8, content: {
            AsyncImage(url: URL(string: content.image)) { image in
                image.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            VStack(alignment: .leading, spacing: 5, content: {
                Text(content.name)
                    .font(.title)
                Text("Especie: \(content.species)")
                    .font(.title3)
                Text("Status: \(content.status)")
                    .font(.title3)
            })
            .frame(maxWidth: .infinity, minHeight: 120)
        })
        .background(Color.baseBG)
        .frame(maxWidth: .infinity, maxHeight: 120)
        .cornerRadius(8)
    }
}

#Preview {
    RMCharSheet(source: RMCharacter(id: 0, name: "Test", species: "Description", status: "Description", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
}
