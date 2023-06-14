//
//  Game+CoreDataProperties.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var image: Data
    @NSManaged public var name: String
    @NSManaged public var type: String
    @NSManaged public var isCharacter: Bool
    @NSManaged public var characters: [String]?

}

extension Game : Identifiable {

}
