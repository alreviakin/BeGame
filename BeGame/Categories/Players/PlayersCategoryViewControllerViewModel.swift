//
//  PlayersCategoryViewControllerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class PlayersCategoryViewControllerViewModel: PlayersCategoryViewControllerViewModelProtocol {
    
    var players: [PlayerStruct] = [
        PlayerStruct(name: "name", username: "asdasd", image: UIImage(named: "cat2")!),
        PlayerStruct(name: "name", username: "asdasd", image: UIImage(named: "cat2")!),
        PlayerStruct(name: "name", username: "asdasd", image: UIImage(named: "cat2")!),
        PlayerStruct(name: "name", username: "asdasd", image: UIImage(named: "cat2")!),
        PlayerStruct(name: "name", username: "asdasd", image: UIImage(named: "cat2")!)
               ]
    
    func numberOfRows() -> Int {
        return players.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> PlayersTableViewCellViewModelProtocol? {
        return PlayersTableViewCellViewModel(player: players[indexPath.row])
    }
    
    func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == players.count - 1
    }
    
}
