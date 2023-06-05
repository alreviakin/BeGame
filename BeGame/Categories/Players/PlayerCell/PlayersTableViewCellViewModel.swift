//
//  PlayersTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class PlayersTableViewCellViewModel: PlayersTableViewCellViewModelProtocol {
    var name: String {
        return player.name
    }
    
    var countGame: String {
        return "20 games"
    }
    
    var image: UIImage {
        return player.image
    }
    
    var player: PlayerStruct
    
    init(player: PlayerStruct) {
        self.player = player
    }
}
