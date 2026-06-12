//
//  Response.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

struct RMInfo: Decodable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
    
}

struct RMResponse<T: Decodable>: Decodable {
    
    let info: RMInfo
    let results: T
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
    
}

struct RMError: Decodable {
    
    let error: String
    
    enum CodingKeys: String, CodingKey {
        case error
    }
    
}
