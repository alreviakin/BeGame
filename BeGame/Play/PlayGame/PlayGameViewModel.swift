//
//  PlayGameViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import Foundation

class PlayGameViewModel: PlayGameViewModelProtocol {
    var game: Game
    
    var players: [Player]
    
    required init(game: Game, players: [Player]) {
        self.game = game
        self.players = players
    }
    
    func getGameImage() -> Data {
        return game.image
    }
}
