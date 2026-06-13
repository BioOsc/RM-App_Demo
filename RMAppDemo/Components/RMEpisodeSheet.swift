//
//  RMEpisodeSheet.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import SwiftUI

struct RMEpisodeSheet: View {
    
    var content: RMEpisode
    
    init(source: RMEpisode) {
        self.content = source
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            VStack(alignment: .leading, spacing: 5, content: {
                Text(content.episode)
                    .font(.system(size: 14, weight: .heavy))
                Text(content.name)
                    .font(.system(size: 18, weight: .regular))
            })
            .frame(maxWidth: .infinity, minHeight: 100)
            VStack(alignment: .trailing, spacing: 5, content: {
                Image(.star)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.accent)
                    .frame(width: 30, height: 30)
                RMButton(title: "Favorito", action: {
                    //ToDo: Implement memory for favorite elements | also implement dinamic title for status in memory
                }, height: 50, width: 125)
            })
            .frame(maxWidth: .infinity, minHeight: 100)
        })
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

#Preview {
    RMEpisodeSheet(source: RMEpisode(id: 0, name: "Test", airDate: "Date", episode: "ECode"))
}
