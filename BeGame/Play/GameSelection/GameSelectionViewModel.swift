//
//  GameSelectionViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import Foundation

class GameSelectionViewModel: GamesCategoryViewControllerViewModel,GameSelectionViewModelProtocol {
    func updateGame() {
        games = CoreDataGameManager.shared.fetchGames()
    }
    
    func getPlayerSelectViewModel(for indexPath: IndexPath) -> PlayerSelectionViewModel {
        return PlayerSelectionViewModel(game: games[indexPath.row])
    }
}
