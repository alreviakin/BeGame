//
//  GamesCategoryViewControllerViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation

protocol GamesCategoryViewControllerViewModelProtocol {
    var games: [Game] { get }
    func numberOfRow() -> Int
    func getGameCellViewModel(for indexPath: IndexPath) -> GameTableViewCellViewModelProtocol?
    func isLastCell(for indexPath: IndexPath) -> Bool
    func saveGame(game: GameStruct)
    
    func getGameViewModel(for indexPath: IndexPath) -> GameViewModelProtocol?
    func deleteGame(for indexPath: IndexPath)
}
