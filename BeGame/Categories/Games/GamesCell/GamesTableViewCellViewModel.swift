//
//  GamesTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 01.06.2023.
//

import Foundation
import UIKit


class GamesTableViewCellViewModel: GamesTableViewCellViewModelProtocol {
    var name: String {
        return game.name
    }
    
    var description: String {
        return game.type
    }
    
    var image: UIImage {
        return UIImage(data: game.image) ?? UIImage()
    }
    
    var game: Game
    
    init(game: Game) {
        self.game = game
    }
}

