//
//  Episode.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

struct RMEpisode: Decodable, Identifiable {
    //MARK: This object was reducted from the full description
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
    }
    
}

struct EpisodeRequest {
    
    let id: Int
    let page: Int
    let grouped: String
    
    init(id: Int, page: Int, grouped: String) {
        self.id = id
        self.page = page
        self.grouped = grouped
    }
    
}
