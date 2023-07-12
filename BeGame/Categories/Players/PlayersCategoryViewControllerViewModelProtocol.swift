//
//  PlayersCategoryViewControllerVeiwModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation

protocol PlayersCategoryViewControllerViewModelProtocol {
    var players: [Player] { get }
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> PlayerTableViewCellViewModelProtocol?
    func isLastCell(for indexPath: IndexPath) -> Bool
    func savePlayer(player: PlayerStruct)
    
    func getPlayerViewModel(for indexPath: IndexPath) -> PlayerViewModelProtocol?
}
