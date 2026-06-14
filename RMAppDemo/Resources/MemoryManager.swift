//
//  MemoryManager.swift
//  RMAppDemo
//
//  Created by BioOsc on 13/06/26.
//

import Foundation
import CoreData

final class MemoryKey {
    
    private init() {}
    
    static let favoriteCharacters = "RM_Mem_favoriteCharacters"
    
}
//MARK: Singleton module
class MemoryManager {
    //MARK: Core Data Config
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "FavCharacter")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    //MARK: User Defaults
    func setFavorite(ref: Int) -> Bool {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        let duplicate: Int? = storage.first(where: { elm in
            return elm == ref
        })
        
        if (duplicate == nil) {
            storage.append(ref)
            UserDefaults.standard.setValue(storage.sorted(), forKey: MemoryKey.favoriteCharacters)
            return true
        } else { return false }
    }
    
    func characterIsFavorite(ref: Int) -> Bool {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        let item: Int? = storage.first(where: { elm in
            return elm == ref
        })
        
        return item != nil
    }
    
    func removeFavorite(ref: Int) {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        storage.removeAll(where: { elm in
            elm == ref
        })
        
        UserDefaults.standard.setValue(storage.sorted(), forKey: MemoryKey.favoriteCharacters)
    }
    //MARK: Core Data
    func saveFavCharacter(char: RMCharacter) {
        let context = MemoryManager.shared.context
        
        let newElement = CDCharacter(context: context)
        newElement.id = Int32(char.id)
        newElement.name = char.name
        newElement.species = char.species
        newElement.status = char.status
        newElement.image = char.image
        
        do {
            try context.save()
            print("Data successfully saved!")
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
    
    func deleteFavCharacter(char: Int) {
        let context = MemoryManager.shared.context
        
        var stored: [CDCharacter] = fetchFavCharacters()
        let element: CDCharacter? = stored.first(where: { item in
            item.id == Int32(char)
        })
        
        if (element != nil) {
            context.delete(element!)
            do {
                try context.save()
                print("Data successfully saved!")
            } catch {
                print("Failed to save data: \(error.localizedDescription)")
            }
        }
        
    }
    
    func fetchFavCharacters() -> [CDCharacter] {
        let context = MemoryManager.shared.context
        
        let fetchRequest: NSFetchRequest<CDCharacter> = CDCharacter.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            print("Failed to fetch records: \(error.localizedDescription)")
            return []
        }
    }
    //MARK: Singleton entity
    static var shared: MemoryManager = {
        return MemoryManager()
    }()
    
}
