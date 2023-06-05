//
//  CoreDataGameManager.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import UIKit
import CoreData

class CoreDataGameManager {
    static let shared = CoreDataGameManager()
    
    private init() {
    }
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    func createGame(name: String, type: String, image: Data) {
        guard let gameEntityDescription = NSEntityDescription.entity(forEntityName: "Game", in: context) else { return }
        let game = Game(entity: gameEntityDescription, insertInto: context)
        game.name = name
        game.image = image
        game.type = type
        
        appDelegate.saveContext()
    }
    
    func fetchGames() -> [Game] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            return (try? context.fetch(fetchRequest) as? [Game]) ?? []
        }
    }
    
    func fetchGames(name: String) -> Game? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            guard let games = try? context.fetch(fetchRequest) as? [Game] else { return nil }
            return games.first { $0.name == name }
        }
    }
    
    func updateGame(oldName: String, newName: String, type: String, image: Data) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            guard let games = try? context.fetch(fetchRequest) as? [Game],
            let game = games.first(where: { $0.name == oldName }) else { return }
            game.name = newName
            game.image = image
            game.type = type
        }
        appDelegate.saveContext()
    }
    
    func deleteAllGames() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            guard let games = try? context.fetch(fetchRequest) as? [Game] else { return }
            games.forEach { context.delete($0) }
        }
        appDelegate.saveContext()
    }
    
    func deleteGame(name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            guard let games = try? context.fetch(fetchRequest) as? [Game],
                  let game = games.first(where: { $0.name == name } ) else { return }
            context.delete(game)
        }
    }
}
