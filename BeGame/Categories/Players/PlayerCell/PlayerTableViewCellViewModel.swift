//
//  PlayersTableViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class PlayerTableViewCellViewModel: PlayerTableViewCellViewModelProtocol {
    var name: String {
        return player.name
    }
    
    var countGame: String {
        return "20 games"
    }
    
    var image: UIImage {
        return UIImage(data: player.image) ?? UIImage()
    }
    
    var player: Player
    
    init(player: Player) {
        self.player = player
    }
}
