//
//  FavoriteCharVM.swift
//  RMAppDemo
//
//  Created by BioOsc on 14/06/26.
//

import Foundation
import Combine

class FavoriteCharViewModel: ObservableObject {
    
    @Published var characters: [RMCharacter] = []
    @Published var isLoading = false
    // - Shared implementation is not necesary, but is consistant -
    private var memory: MemoryManager = MemoryManager.shared
    
    init() {
        getMemory()
    }
    
    func getMemory() {
        isLoading = true
        let memContent: [CDCharacter] =  memory.fetchFavCharacters()
        //ToDo: Evaluate implement paginaton for memory objects, may be with range for sub array
        characters = memContent.map({ item in
            return RMCharacter(id: Int(item.id), name: item.name!, species: item.species!, status: item.status!, image: item.image!, episode: [])
        })
        isLoading = false
    }
    
}
