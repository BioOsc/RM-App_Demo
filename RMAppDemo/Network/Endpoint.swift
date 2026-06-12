//
//  Endpoint.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import Foundation

final class Endpoint {
    
    private init() {}
    //MARK: Segmentation may not be by Method but by action
    struct GET {
        static let characters = "/character"
        static let locations = "/location"
        static let episodes = "/episode"
    }
    
}
