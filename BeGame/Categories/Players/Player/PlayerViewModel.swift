//
//  PlayerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

class PlayerViewModel: PlayerViewModelProtocol {
    var title: String
    
    var imageData: Data
    
    var nameStatistic: String = "Статистика игр"
    
    var countCollectionCell: Int = 3
    
    var player: Player
    
    var gameStats: [GameStat] = []
    
    var gameHistory: [GameHistory]?
    
    init(player: Player) {
        self.player = player
        gameHistory = CoreDataGameHistoryManager.shared.fetchGameHistories(player: player)
        title = player.name
        imageData = player.image
        getStats()
    }
    
    func numberOfRowsTable() -> Int {
        return gameStats.count
    }
    
    func getCollectionCellViewModel(for indexPath: IndexPath) -> PlayerCollectionCellViewModelProtocol? {
        guard let gameHistory, gameHistory.count > 0 else {
            switch indexPath.row {
            case 0:
                return PlayerCollectionCellViewModel(name: "партий", count: "0")
            case 1:
                return PlayerCollectionCellViewModel(name: "побед", count: "0%")
            case 2:
                return PlayerCollectionCellViewModel(name: "разных игр", count: "0")
            default:
                return nil
            }
        }
        
        switch indexPath.row {
        case 0:
            let count = gameHistory.count
            if count == 0 || count > 4 {
                return PlayerCollectionCellViewModel(name: "партий", count: "\(count)")
            } else if count == 1 {
                return PlayerCollectionCellViewModel(name: "партия", count: "\(count)")
            } else {
                return PlayerCollectionCellViewModel(name: "партии", count: "\(count)")
            }
        case 1:
            var countWinGames = 0
            for gameStat in gameStats {
                countWinGames += gameStat.countWin
            }
            let winPercent = Int((Float(countWinGames) / Float(gameHistory.count) * 100).rounded())
            return PlayerCollectionCellViewModel(name: "победы", count: "\(winPercent)%")
        case 2:
            return PlayerCollectionCellViewModel(name: "разных игр", count: "\(gameStats.count)")
        default:
            return nil
        }
    }
    
    func getStats() {
        guard let gameHistory else { return }
        for history in gameHistory {
            let countPoints = Int(history.scoredPoints?[player.username] ?? 0)
            if gameStats.contains(where: { $0.gameName == history.gameName }) {
                let existsGameStatIndex = gameStats.firstIndex(where: { $0.gameName == history.gameName})
                guard let existsGameStatIndex else { continue }
                var existsGameStat = gameStats.remove(at: existsGameStatIndex)
                existsGameStat.countGame += 1
                existsGameStat.countPoints += Int(history.scoredPoints?[player.username] ?? 0)
                existsGameStat.countWin += history.isWin ? 1 : 0
                existsGameStat.maxPoints = existsGameStat.maxPoints > countPoints ?  existsGameStat.countPoints : countPoints
                gameStats.append(existsGameStat)
            } else {
                let gameStat = GameStat(gameName: history.gameName,
                                        countGame: 1,
                                        countWin: history.isWin ? 1 : 0,
                                        countPoints: Int(history.scoredPoints?[player.username] ?? 0),
                                        maxPoints: Int(history.scoredPoints?[player.username] ?? 0)
                )
                gameStats.append(gameStat)
            }
        }
    }
    
    func getTableCellViewModel(for indexPath: IndexPath) -> PlayerDetailTableViewCellViewModelProtocol? {
        return PlayerDetailTableViewCellViewModel(gameStat: gameStats[indexPath.row])
    }
    
    
}
