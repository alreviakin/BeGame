//
//  GameHistory+CoreDataProperties.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//
//

import Foundation
import CoreData


extension GameHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameHistory> {
        return NSFetchRequest<GameHistory>(entityName: "GameHistory")
    }

    @NSManaged public var date: Date
    @NSManaged public var gameName: String
    @NSManaged public var isWin: Bool
    @NSManaged public var playerUsernames: [String]
    @NSManaged public var playerWinUsernames: [String]?
    @NSManaged public var scoredPoints: [String : Int32]?
    @NSManaged public var time: Int32

}

extension GameHistory : Identifiable {

}
