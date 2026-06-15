//
//  CDCharacter+CoreDataProperties.swift
//  
//
//  Created by BioOsc on 14/06/26.
//
//

public import Foundation
public import CoreData


public typealias CDCharacterCoreDataPropertiesSet = NSSet

extension CDCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCharacter> {
        return NSFetchRequest<CDCharacter>(entityName: "CDCharacter")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var status: String?
    @NSManaged public var species: String?
    @NSManaged public var image: String?

}
