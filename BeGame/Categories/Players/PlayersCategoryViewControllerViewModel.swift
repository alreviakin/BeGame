//
//  PlayersCategoryViewControllerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class PlayersCategoryViewControllerViewModel: PlayersCategoryViewControllerViewModelProtocol {
    
    var players: [Player] =  CoreDataPlayerManager.shared.fetchPlayers()
    
    func numberOfRows() -> Int {
        return players.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> PlayerTableViewCellViewModelProtocol? {
        return PlayerTableViewCellViewModel(player: players[indexPath.row])
    }
    
    func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == players.count - 1
    }
    
    func savePlayer(player: PlayerStruct) {
        guard let image = player.image.pngData() else {
            return
        }
        CoreDataPlayerManager.shared.createPlayer(name: player.name,
                                                  username: player.username,
                                                  image: image)
        players = CoreDataPlayerManager.shared.fetchPlayers()
    }
    
    func getPlayerViewModel(for indexPath: IndexPath) -> PlayerViewModelProtocol? {
        return PlayerViewModel(player: players[indexPath.row])
    }
    
    func deletePlayer(for indexPath: IndexPath) {
        CoreDataPlayerManager.shared.deletePlayer(username: players[indexPath.row].username)
        players.remove(at: indexPath.row)
    }
}
