//
//  PlayerDetailTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

class PlayerDetailTableViewCellViewModel: PlayerDetailTableViewCellViewModelProtocol {
    var nameGame: String
    
    var countGame: String
    
    var countWinGame: String
    
    var avaragePointGame: String
    
    var bestPointGame: String
    
    init(gameStat: GameStat) {
        nameGame = gameStat.gameName
        countGame = "\(gameStat.countGame)"
        countWinGame = "\(gameStat.countWin)"
        avaragePointGame = "\(Int(gameStat.countPoints / gameStat.countGame))"
        bestPointGame = "\(gameStat.maxPoints)"
    }
}
