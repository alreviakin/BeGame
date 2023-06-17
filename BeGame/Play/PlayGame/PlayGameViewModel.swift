//
//  PlayGameViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import Foundation
import UIKit

class PlayGameViewModel: PlayGameViewModelProtocol {
    var game: Game
    
    var collectionImages: [UIImage] = [
        UIImage(named: "pauseClock")!,
        UIImage(named: "playClock")!,
        UIImage(systemName: "calendar")!
    ]
    
    var countTime: Int
    
    var players: [Player]
    
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
            return PlayGameCollectionViewCellViewModel(nameLabel: getCurrentDate(), images: [collectionImages[2]])
        default:
            return PlayGameCollectionViewCellViewModel(nameLabel: "", images: [])
        }
    }
    
    private func getCurrentDate() -> String {
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yy"
        return dateFormater.string(from: date)
    }
    
    //MARK: - Table
    
    func numberOfRowsTable() -> Int {
        return players.count
    }
    
    func getPlayGameTableViewCellViewModel(for indexPath: IndexPath) -> PlayGameTableViewCellViewModelProtocol {
        var cellViewModel = PlayGameTableViewCellViewModel(namePlayer: players[indexPath.row ].name)
        cellViewModel.setGameType(gameType: game.type)
        return cellViewModel
    }
}
