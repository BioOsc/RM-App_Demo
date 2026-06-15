//
//  KeyLocale.swift
//  RMAppDemo
//
//  Created by BioOsc on 14/06/26.
//

import Foundation

class LocalString {
    
    private init () {}
    
    enum RefTable: String {
        case global = "Global"
        case character = "Characters"
        case detail = "Detail"
        case favorite = "Favorites"
    }
    
    static func getFrom(key: String, in table: RefTable) -> String {
        return String(NSLocalizedString(key, tableName: table.rawValue, comment: ""))
    }
    
    static func format(text: String, with key: String, in table: RefTable) -> String {
        let format: String = getFrom(key: key, in: table)
        return String(format: format, text)
    }
    
}
//MARK: Key
struct KeyLocal {
    
    struct Global {
        static let species = "text_Species"
        static let status = "text_Status"
    }
    
    //MARK: Character
    struct Character {
        static let topBarTitle = "text_TopBarTitle"
        static let topBarPlaceholder = "text_TopBarPlaceholder"
        static let btnPrev = "button_PrevPage"
        static let btnNext = "button_NextPage"
        static let btnFavorite = "button_GoToFavorite"
    }
    //MARK: Detail
    struct Detail {
        static let btnMap = "button_GoToMap"
        static let btnAddFav = "button_AddFavorite"
        static let btnRmvFav = "button_RemoveFavorite"
    }
    //MARK: Favorite
    struct Favorite {
        
        static let title = "controller_Title"
        
    }
    
}
