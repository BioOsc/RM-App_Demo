//
//  Character.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

struct RMCharacter: Decodable, Identifiable {
    //MARK: This object was reducted from the full description
    let id: Int
    let name: String
    let species: String
    let status: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case status
        case image
    }
    
}

struct CharacterRequest {
    
    let id: Int
    let page: Int
    
    init(id: Int, page: Int) {
        self.id = id
        self.page = page
    }
    
}
