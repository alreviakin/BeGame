//
//  CoreDataPlayerManager.swift
//  BeGame
//
//  Created by Алексей Ревякин on 03.06.2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataPlayerManager {
    
    static let shared = CoreDataPlayerManager()
    
    private init() {
        
    }
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func createPlayer(name: String, username: String, image: Data) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Player", in: context) else { return }
        let player = Player(entity: entityDescription, insertInto: context)
        player.name = name
        player.username = username
        player.image = image
        appDelegate.saveContext()
    }
    
    func fetchPlayers() -> [Player] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            return (try? context.fetch(fetchRequest) as? [Player]) ?? []
        }
    }
    
    func fetchPlayer(username: String) -> Player? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            guard let players = try? context.fetch(fetchRequest) as? [Player] else { return nil }
            return players.first{ $0.username == username }
        }
    }
    
    public func updatePlayer(newName: String, username: String, image: Data) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            guard let players = try? context.fetch(fetchRequest) as? [Player], let player = players.first(where: { $0.username == username }) else {return}
            player.name = newName
            player.image = image
        }
        appDelegate.saveContext()
    }
    
    public func deletePlayer(username: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            guard let players = try? context.fetch(fetchRequest) as? [Player], let player = players.first(where: {$0.username == username}) else {return}
            context.delete(player)
        }
        appDelegate.saveContext()
    }
    
}
