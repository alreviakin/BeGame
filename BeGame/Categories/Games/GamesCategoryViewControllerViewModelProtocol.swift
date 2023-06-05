//
//  GamesCategoryViewControllerViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation

protocol GamesCategoryViewControllerViewModelProtocol {
    var games: [GameStruct] { get }
    func numberOfRow() -> Int
    func cellViewModel(for indexPath: IndexPath) -> GamesTableViewCellViewModelProtocol?
    func isLastCell(for indexPath: IndexPath) -> Bool
}
