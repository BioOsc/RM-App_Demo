//
//  CharDetailVM.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import Foundation
import Combine

class CharDetailViewModel: ObservableObject {
    
    @Published var character: RMCharacter?
    @Published var episodes: [RMEpisode] = []
    @Published var isLoading = false
    
    private var api: RequestAPI = RequestAPI.shared
    
    init(id: Int) {
        getBy(id: id)
    }
    
    func getBy(id: Int) {
        isLoading = true
        api.chararcter.getById(request: CharacterRequest(id: id, page: 0), { success, object, error in
            if (success) {
                self.character = object
                self.getEpisodes()
            }
            self.isLoading = false
        })
    }
    
    func getEpisodes() {
        isLoading = true
        if let eps = character?.episode {
            var contents: String = ""
            for item in eps {
                contents = contents + item.replacingOccurrences(of: "https://rickandmortyapi.com/api/episode/", with: ",")
            }
            
            api.episode.getByIds(request: EpisodeRequest(id: 0, page: 0, grouped: contents), { success, object, error in
                if (success) {
                    self.episodes = object
                }
                self.isLoading = false
            })
        } else { self.isLoading = false }
    }
    
}
