//
//  GameViewControllerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 20.06.2023.
//

import Foundation

class GameViewModel: GameViewModelProtocol {
    var game: Game
    
    var playerStats: [PlayerStat] = []
    
    var gameType: String = ""
    
    var gameHistory: [GameHistory]?
    
    var title: String { game.name }
    
    var imageData: Data { game.image }
    
    var countCollectionCell: Int = 3
    
    var nameStatistic: String = "Статистика игроков"
    
    init(game: Game) {
        self.game = game
        gameHistory = CoreDataGameHistoryManager.shared.fetchGameHistories(game: game)
        gameType = game.type
        guard let gameTypeStruct = GameType(rawValue: gameType) else { return }
        getStats(gameType: gameTypeStruct)
    }
    
    func numberOfRowsTable() -> Int {
        return playerStats.count
    }
    
    func getTableCellViewModel(for indexPath: IndexPath) -> GameDetailTableViewCellViewModelProtocol? {
        guard let typeGame = GameType(rawValue: gameType) else { return nil}
        return GameDetailTableViewCellViewModel(playerStat: playerStats[indexPath.row], typeGame: typeGame)
    }
    
    func getCollectionCellViewModel(for indexPath: IndexPath) -> GameCollectionCellViewModelProtocol? {
        guard let gameHistory, gameHistory.count > 0 else {
            switch indexPath.row {
            case 0:
                return GameCollectionCellViewModel(count: "0", name: "партий")
            case 1:
                return GameCollectionCellViewModel(count: DateManager.shared.intToTimeString(countTime: 0), name: "время\nв игре")
            case 2:
                return GameCollectionCellViewModel(count: "-", name: "последняя\nигра")
            default:
                return nil
            }
        }
        switch indexPath.row {
        case 0:
            let count = gameHistory.count
            if count == 0 || count > 4{
                return GameCollectionCellViewModel(count: String(count), name: "партий")
            } else if count == 1 {
                return GameCollectionCellViewModel(count: String(count), name: "партия")
            } else {
                return GameCollectionCellViewModel(count: String(count), name: "партии")
            }
            
        case 1:
            var time: Int = 0
            for history in gameHistory {
                time += Int(history.time)
            }
            return GameCollectionCellViewModel(count: DateManager.shared.intToTimeString(countTime: time), name: "в игре")
        case 2:
            guard let date = gameHistory.last?.date else { return nil}
            return GameCollectionCellViewModel(count: DateManager.shared.dateToString(date: date), name: "последняя игра")
        default:
            return nil
        }
    }
}


extension GameViewModel {
    func getStats(gameType: GameType) {
        guard let gameHistory else { return }
        var playerStats: [PlayerStat] = []
        switch gameType {
        case .scoring:
            for game in gameHistory {
                let playerUsernames = game.playerUsernames
                for playerUsername in playerUsernames {
                    guard let playerName = CoreDataPlayerManager.shared.fetchPlayer(username: playerUsername)?.name else { continue }
                    let countPoints = Int(game.scoredPoints?[playerUsername] ?? 0)
                    let isWin = game.playerWinUsernames?.contains(playerUsername) ?? false
                    if playerStats.contains(where: { $0.playerName == playerName }) {
                        let existsPlayerIndex = playerStats.firstIndex(where: {$0.playerName == playerName})
                        guard let existsPlayerIndex else { continue }
                        var existsPlayerStat = playerStats[existsPlayerIndex]
                        playerStats.remove(at: existsPlayerIndex)
                        existsPlayerStat.countGame += 1
                        if isWin {
                            existsPlayerStat.countWin += 1
                        }
                        existsPlayerStat.countPoints += countPoints
                        if countPoints > existsPlayerStat.maxPoints {
                            existsPlayerStat.maxPoints = countPoints
                        }
                        playerStats.append(existsPlayerStat)
                    } else {
                        let playerStat = PlayerStat(
                            playerName: playerName,
                            countGame: 1,
                            countWin: isWin ? 1 : 0,
                            countPoints: countPoints,
                            maxPoints: countPoints)
                        playerStats.append(playerStat)
                    }
                }
            }
        default:
            print(gameType)
            for game in gameHistory {
                let playerUsernames = game.playerUsernames
                for playerUsername in playerUsernames {
                    guard let playerName = CoreDataPlayerManager.shared.fetchPlayer(username: playerUsername)?.name else { continue }
                    let isWin = game.isWin
                    if playerStats.contains(where: { $0.playerName == playerName }) {
                        let existsPlayerIndex = playerStats.firstIndex(where: {$0.playerName == playerName})
                        guard let existsPlayerIndex else { continue }
                        var existsPlayerStat = playerStats[existsPlayerIndex]
                        playerStats.remove(at: existsPlayerIndex)
                        existsPlayerStat.countGame += 1
                        if isWin {
                            existsPlayerStat.countWin += 1
                        }
                        playerStats.append(existsPlayerStat)
                    } else {
                        let playerStat = PlayerStat(
                            playerName: playerName,
                            countGame: 1,
                            countWin: isWin ? 1 : 0,
                            countPoints: 0,
                            maxPoints: 0)
                        playerStats.append(playerStat)
                    }
                }
            }
        }
        self.playerStats = playerStats
    }
}
