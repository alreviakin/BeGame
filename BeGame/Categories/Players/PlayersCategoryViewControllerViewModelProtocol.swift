//
//  PlayersCategoryViewControllerVeiwModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation

protocol PlayersCategoryViewControllerViewModelProtocol {
    var players: [PlayerStruct] { get }
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> PlayersTableViewCellViewModelProtocol?
    func isLastCell(for indexPath: IndexPath) -> Bool
}
