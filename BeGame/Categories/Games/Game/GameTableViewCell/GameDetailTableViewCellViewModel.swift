//
//  GameDetailTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation

class GameDetailTableViewCellViewModel: GameDetailTableViewCellViewModelProtocol {
    
    var namePlayer: String
    
    var countGame: String
    
    var countWinGame: String
    
    var avaragePointGame: String
    
    var bestPointGame: String
    
    init(playerStat: PlayerStat) {
        namePlayer = playerStat.playerName
        countGame = "\(playerStat.countGame)"
        countWinGame = "\(Int(Float(playerStat.countWin) / Float(playerStat.countGame) * 100))"
        avaragePointGame = "\(playerStat.countPoints / playerStat.countGame)"
        bestPointGame = "\(playerStat.maxPoints)"
    }
}
