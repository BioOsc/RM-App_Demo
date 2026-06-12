//
//  CharacterSegment.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import Foundation
import Alamofire

class CharacterSegment {
    
    private var Base_URL: String = ""
    
    init (to server: Server) {
        Base_URL = server.rawValue
    }
    
    func getPage(request: CharacterRequest,_ onResult: @escaping (_ success: Bool, _ dataResponse: [RMCharacter], _ errorResponse: RMError?) -> ()) {
        
        let url: String = Base_URL + Endpoint.GET.characters + "/?page=\(request.page)"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { result in
            switch (result.response!.statusCode) {
                case 200:
                    let object: RMResponse<[RMCharacter]> = try! JSONDecoder().decode(RMResponse.self, from: result.data!)
                    onResult(true, object.results, nil)
                    break
                case 404:
                    let object: RMError = try! JSONDecoder().decode(RMError.self, from: result.data!)
                    onResult(false, [], object)
                    break
                default:
                    onResult(false, [], nil)
                    break
            }
        })
    }
    
    func getById(request: CharacterRequest,_ onResult: @escaping (_ success: Bool, _ dataResponse: RMCharacter?, _ errorResponse: RMError?) -> ()) {
        
        let url: String = Base_URL + Endpoint.GET.characters + "/\(request.id)"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { result in
            switch (result.response!.statusCode) {
                case 200:
                    let object: RMCharacter = try! JSONDecoder().decode(RMCharacter.self, from: result.data!)
                onResult(true, object, nil)
                    break
                case 404:
                    let object: RMError = try! JSONDecoder().decode(RMError.self, from: result.data!)
                    onResult(false, nil, object)
                    break
                default:
                    onResult(false, nil, nil)
                    break
            }
        })
    }
    
}
