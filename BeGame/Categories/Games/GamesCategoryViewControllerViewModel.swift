//
//  GamesCategoryViewControllerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

class GamesCategoryViewControllerViewModel: GamesCategoryViewControllerViewModelProtocol {
    
    var games: [GameStruct] = [
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card),
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card),
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card),
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card),
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card),
        GameStruct(name: "Name", image: UIImage(named: "cat2")!, type: .card)
    ]
    
    func numberOfRow() -> Int {
        return games.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> GamesTableViewCellViewModelProtocol? {
        return GamesTableViewCellViewModel(game: games[indexPath.row])
    }
    
    func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == games.count - 1
    }
    
    
}
