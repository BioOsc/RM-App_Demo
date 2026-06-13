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
            }
            self.isLoading = false
        })
    }
    
}
