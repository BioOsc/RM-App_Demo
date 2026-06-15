//
//  CharacterVM.swift
//  RMAppDemo
//
//  Created by BioOsc on 12/06/26.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    @Published var characters: [RMCharacter] = []
    @Published var isLoading = false
    
    private var api: RequestAPI = RequestAPI.shared
    
    init() {
        getBy(page: 1)
    }
    
    func getBy(page: Int) {
        isLoading = true
        api.chararcter.getPage(request: CharacterRequest(id: 0, page: page), { success, object, error in
            if (success) {
                self.characters = object
            }
            self.isLoading = false
        })
    }
    
}
