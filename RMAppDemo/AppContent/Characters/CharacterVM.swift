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
        get()
    }
    
    func get() {
        isLoading = true
        api.chararcter.getPage(request: CharacterRequest(id: 0, page: 1), { success, object, error in
            if (success) {
                self.characters = object
            }
            self.isLoading = false
        })
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
    
    func getBy(id: Int) {
        isLoading = true
        api.chararcter.getById(request: CharacterRequest(id: id, page: 0), { success, object, error in
            if (success) {
                //self.characters = object
            }
            self.isLoading = false
        })
    }
    
}
