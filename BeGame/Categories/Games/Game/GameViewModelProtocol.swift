//
//  GameViewControllerViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 20.06.2023.
//

import Foundation

protocol GameViewModelProtocol: BaseDetailCategoryViewModelProtocol {
    var game: Game { get }
    
    var gameType: String { get }
    
    var playerStats: [PlayerStat] { get }
    
    var gameHistory: [GameHistory]? { get }
    
    func numberOfRowsTable() -> Int 
    func getCollectionCellViewModel(for indexPath: IndexPath) -> GameCollectionCellViewModelProtocol?
    func getStats(gameType: GameType)
    func getTableCellViewModel(for indexPath: IndexPath) -> GameDetailTableViewCellViewModelProtocol?
}
