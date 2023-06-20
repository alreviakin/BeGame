//
//  PlayGameViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import Foundation
import UIKit

class PlayGameViewModel: PlayGameViewModelProtocol {
    
    var scoredPoints: [String : Int32]?
    
    var playerWin: Player?
    
    var game: Game
    
    var collectionImages: [UIImage] = [
        UIImage(named: "pauseClock")!,
        UIImage(named: "playClock")!,
        UIImage(systemName: "calendar")!
    ]
    
    var countTime: Int
    
    var players: [Player]
    
    var isWin: Bool = false
    
    required init(game: Game, players: [Player]) {
        self.game = game
        self.players = players
        self.countTime = 0
    }
    
    func getGameImage() -> Data {
        return game.image
    }
        
    //MARK: - Collection
    
    func updateTime() -> String {
        countTime += 1
        let hours = countTime / 3600
        let minutes = countTime / 60 % 60
        let seconds = countTime % 60
        
        var times: [String] = []
        if hours > 0 {
          times.append("\(hours)h")
        }
        if minutes > 0 {
          times.append("\(minutes)m")
        }
        if hours == 0 {
            times.append("\(seconds)s")
        }
        return times.joined(separator: " ")
    }
    
    func addTime(seconds: Int) {
        countTime += seconds
    }
    
    func getPlayGameCollectionViewCellViewModel(for indexPath: IndexPath) -> PlayGameCollectionViewCellViewModel {
        switch indexPath.row {
        case 0:
            var images: [UIImage] = []
            images.append(collectionImages[0])
            images.append(collectionImages[1])
            return PlayGameCollectionViewCellViewModel(nameLabel: "0s", images: images)
        case 1:
            return PlayGameCollectionViewCellViewModel(nameLabel: DateManager.shared.getCurrentDate(), images: [collectionImages[2]])
        default:
            return PlayGameCollectionViewCellViewModel(nameLabel: "", images: [])
        }
    }
    
    //MARK: - Table
    
    func numberOfRowsTable() -> Int {
        return players.count
    }
    
    func getPlayGameTableViewCellViewModel(for indexPath: IndexPath) -> PlayGameTableViewCellViewModelProtocol {
        let cellViewModel = PlayGameTableViewCellViewModel(namePlayer: players[indexPath.row ].name)
        cellViewModel.setGameType(gameType: game.type)
        return cellViewModel
    }
    
    func getGameHistoryStruct() -> GameHistoryStruct {
        var playerUsernames: [String] = []
        for player in players {
            playerUsernames.append(player.username)
        }
        return GameHistoryStruct(
            date: DateManager.shared.getCurrentDate(),
            gameName: game.name,
            isWin: isWin,
            playerUsernames: playerUsernames,
            playerWinUsername: playerWin?.username,
            scoredPoints: scoredPoints,
            time: Int32(countTime))
    }
}
