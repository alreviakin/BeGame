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
    
    var playersWin: [String]?
    
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
        guard let typeGame = GameType(rawValue: game.type) else { return }
        if typeGame == .scoring {
            self.scoredPoints = [:]
            for player in players {
                scoredPoints?[player.username] = 0
            }
        }
    }
    
    func getGameImage() -> Data {
        return game.image
    }
        
    //MARK: - Collection
    
    func updateTime() -> String {
        countTime += 1
        return DateManager.shared.intToTimeString(countTime: countTime)
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
    
    //MARK: - CoreData
    
    func getGameHistoryStruct() -> GameHistoryStruct {
        var playerUsernames: [String] = []
        for player in players {
            playerUsernames.append(player.username)
        }
        if game.type == GameType.scoring.rawValue {
            getWinPlayer()
        }
        return GameHistoryStruct(
            date: DateManager.shared.getCurrentDate(),
            gameName: game.name,
            isWin: isWin,
            playerUsernames: playerUsernames,
            playerWinUsername: playersWin,
            scoredPoints: scoredPoints,
            time: Int32(countTime))
    }
    
    func changePoints(for index: Int, with points: String) {
        guard let pointsInt = Int32(points) else { return }
        scoredPoints?[players[index].username] = pointsInt
    }
    
    func getWinPlayer() {
        guard let scoredPoints else { return }
        playersWin = []
        let max = scoredPoints.values.max()
        for player in players {
            if scoredPoints[player.username] == max {
                playersWin?.append(player.username)
            }
        }
    }
}
