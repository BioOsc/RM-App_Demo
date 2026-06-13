//
//  RequestAPI.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import Foundation
import Alamofire

enum Server: String {
    case rmAPI = "https://rickandmortyapi.com/api"
}

class RequestAPI {
    
    var chararcter: CharacterSegment!
    var episode: EpisodeSegment!
    
    private init () {
        let server: Server = .rmAPI
        
        chararcter = CharacterSegment(to: server)
        episode = EpisodeSegment(to: server)
    }
    
    static var shared: RequestAPI = {
        return RequestAPI()
    }()
    
}
