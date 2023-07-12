//
//  PlayerViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

protocol PlayerViewModelProtocol: BaseDetailCategoryViewModelProtocol {
    var player: Player { get }
    
    var gameStats: [GameStat] { get }
    
    var gameHistory: [GameHistory]? { get }
    
    func numberOfRowsTable() -> Int
    func getCollectionCellViewModel(for indexPath: IndexPath) -> PlayerCollectionCellViewModelProtocol?
    func getStats()
    func getTableCellViewModel(for indexPath: IndexPath) -> PlayerDetailTableViewCellViewModelProtocol?
}
