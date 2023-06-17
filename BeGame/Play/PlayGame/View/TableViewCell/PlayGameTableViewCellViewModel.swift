//
//  PlayGameTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation

class PlayGameTableViewCellViewModel: PlayGameTableViewCellViewModelProtocol {
    var namePlayer: String
    
    var character: String?
    
    var gameType: String?
    
    var points: Int?
    
    var acceptableSymbolsArr: [String] = ["0",
                                          "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          ""
    ]
    
    init(namePlayer: String, character: String? = nil) {
        self.namePlayer = namePlayer
        self.character = character
    }
    
    func setCharacter(character: String) {
        self.character = character
    }
    
    func setGameType(gameType: String) {
        self.gameType = gameType
    }
}
