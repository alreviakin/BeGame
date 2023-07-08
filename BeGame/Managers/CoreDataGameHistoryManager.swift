//
//  CoreDataGameHistoryManager.swift
//  BeGame
//
//  Created by Алексей Ревякин on 18.06.2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataGameHistoryManager {
    static let shared = CoreDataGameHistoryManager()
    
    private init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext 
    }
    
    func createGameHistory(gameHistoryStruct: GameHistoryStruct) {
        guard let entityDiscription = NSEntityDescription.entity(forEntityName: "GameHistory", in: context) else { return }
        let gameHistory = GameHistory(entity: entityDiscription, insertInto: context)
        gameHistory.date = gameHistoryStruct.date
        gameHistory.gameName = gameHistoryStruct.gameName
        gameHistory.isWin = gameHistoryStruct.isWin
        gameHistory.playerUsernames = gameHistoryStruct.playerUsernames
        gameHistory.playerWinUsernames = gameHistoryStruct.playerWinUsername
        gameHistory.scoredPoints = gameHistoryStruct.scoredPoints
        gameHistory.time = gameHistoryStruct.time
        
        appDelegate.saveContext()
    }
    
    func fetchGameHistories() -> [GameHistory]  {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            return (try? context.fetch(fetchRequest) as? [GameHistory]) ?? []
        }
    }
    
    func fetchGameHistory(date: Date) -> GameHistory? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            guard let gameHistories = try? context.fetch(fetchRequest) as? [GameHistory] else { return nil }
            return gameHistories.first { $0.date == date }
        }
    }
    
    func fetchGameHistories(game: Game) -> [GameHistory]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            guard let gameHistory = try? context.fetch(fetchRequest) as? [GameHistory] else { return nil}
            return gameHistory.filter { $0.gameName == game.name }.sorted(by: { firstGameHistory, SecondGameHistory in
                guard let firstDate = firstGameHistory.date, let secondDate = SecondGameHistory.date else { return false}
                return firstDate < secondDate
            })
        }
    }
    
    func updateGame(gameHistoryStruct: GameHistoryStruct) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            guard let gameHistories = try? context.fetch(fetchRequest) as? [GameHistory],
                  let gameHistory = gameHistories.first(where: { $0.date == gameHistoryStruct.date }) else { return }
            gameHistory.gameName = gameHistoryStruct.gameName
            gameHistory.isWin = gameHistoryStruct.isWin
            gameHistory.playerUsernames = gameHistoryStruct.playerUsernames
            gameHistory.playerWinUsernames = gameHistoryStruct.playerWinUsername
            gameHistory.scoredPoints = gameHistoryStruct.scoredPoints
            gameHistory.time = gameHistoryStruct.time
        }
        appDelegate.saveContext()
    }
    
    func deleteAllGameHistories() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            guard let gameHistories = try? context.fetch(fetchRequest) as? [GameHistory] else { return }
            gameHistories.forEach { context.delete($0) }
        }
        appDelegate.saveContext()
    }
    
    func deleteGame(date: Date) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameHistory")
        do {
            guard let gameHistories = try? context.fetch(fetchRequest) as? [GameHistory],
                  let gameHistory = gameHistories.first(where: { $0.date == date } ) else { return }
            context.delete(gameHistory)
        }
    }
}
