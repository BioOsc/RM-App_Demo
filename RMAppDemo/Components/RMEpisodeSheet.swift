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
                    .frame(width: 250, alignment: .leading)
                Text("\(content.id) - \(content.name)")
                    .font(.system(size: 18, weight: .regular))
                    .frame(width: 250, alignment: .leading)
            })
            .frame(maxWidth: .infinity, minHeight: 100)
            VStack(alignment: .trailing, spacing: 5, content: {
                Image(.checkmark) //ToDo: Implement conditional to memory?
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.accent)
                    .frame(width: 30, height: 30)
            })
            .frame(maxWidth: .infinity, minHeight: 100)
        })
        .frame(maxWidth: .infinity, maxHeight: 100)
    }
}

#Preview {
    RMEpisodeSheet(source: RMEpisode(id: 0, name: "Test", airDate: "Date", episode: "ECode"))
}
