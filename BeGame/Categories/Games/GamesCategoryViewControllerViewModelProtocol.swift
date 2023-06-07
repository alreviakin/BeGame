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
    func cellViewModel(for indexPath: IndexPath) -> GameTableViewCellViewModelProtocol?
    func isLastCell(for indexPath: IndexPath) -> Bool
    func saveGame(game: GameStruct)
}
