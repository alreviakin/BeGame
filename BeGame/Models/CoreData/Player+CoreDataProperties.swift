//
//  Player+CoreDataProperties.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String
    @NSManaged public var image: Data
    @NSManaged public var username: String

}

extension Player : Identifiable {

}
