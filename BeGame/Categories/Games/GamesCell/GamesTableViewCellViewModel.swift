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
        return "Description"
    }
    
    var image: UIImage {
        return game.image
    }
    
    var game: GameStruct
    
    init(game: GameStruct) {
        self.game = game
    }
}

