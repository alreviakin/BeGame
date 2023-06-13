//
//  PlayerSelectionViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import Foundation

protocol PlayerSelectionViewModelProtocol {
    func updatePlayer()
    
    func getPlayer(for indexPath: IndexPath) -> Player
    
    var game: Game { get }
    
    var selectedPlayers: [Player] { get }
    
    init(game: Game)
    
    func getPlayGameViewModel() -> PlayGameViewModelProtocol
    
    func addSelectedPlayer(player: Player) -> Bool
    
    func deleteSelectedPlayer(player: Player)
    
    func deleteAllSelectedPlayers()
}
