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
    
    func getGameCellViewModel(for indexPath: IndexPath) -> GameTableViewCellViewModelProtocol? {
        return GameTableViewCellViewModel(game: games[indexPath.row])
    }
    
    func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == games.count - 1
    }
    
    func saveGame(game: GameStruct) {
        guard let image = game.image.pngData() else { return }
        CoreDataGameManager.shared.createGame(name: game.name,
                                              type: game.type.rawValue,
                                              image: image,
                                              isCharacter: false,
                                              characters: nil)
        games = CoreDataGameManager.shared.fetchGames()
    }
    
    func getGameViewModel(for indexPath: IndexPath) -> GameViewModelProtocol? {
        return GameViewModel(game: games[indexPath.row])
    }
    
    func deleteGame(for indexPath: IndexPath) {
        CoreDataGameManager.shared.deleteGame(name: games[indexPath.row].name)
        games.remove(at: indexPath.row)
    }
}
