//
//  GamesCategoryViewControllerViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

class GamesCategoryViewControllerViewModel: GamesCategoryViewControllerViewModelProtocol {
    
    var games: [Game] = CoreDataGameManager.shared.fetchGames()
    
    func numberOfRow() -> Int {
        return games.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> GameTableViewCellViewModelProtocol? {
        return GameTableViewCellViewModel(game: games[indexPath.row])
    }
    
    func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == games.count - 1
    }
    
    func saveGame(game: GameStruct) {
        guard let image = game.image.pngData() else { return }
        CoreDataGameManager.shared.createGame(name: game.name,
                                              type: game.type.rawValue,
                                              image: image)
        games = CoreDataGameManager.shared.fetchGames()
    }
    
    
}
