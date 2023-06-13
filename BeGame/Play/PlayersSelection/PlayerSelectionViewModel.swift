//
//  PlayerSelectionViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import Foundation

class PlayerSelectionViewModel: PlayersCategoryViewControllerViewModel, PlayerSelectionViewModelProtocol {

    var game: Game
    
    var selectedPlayers: [Player]
    
    required init(game: Game) {
        self.game = game
        self.selectedPlayers = []
    }
    
    func updatePlayer() {
        players = CoreDataPlayerManager.shared.fetchPlayers()
    }
    
    func getPlayer(for indexPath: IndexPath) -> Player {
        return players[indexPath.row]
    }
    
    func getPlayGameViewModel() -> PlayGameViewModelProtocol {
        return PlayGameViewModel(game: game, players: selectedPlayers)
    }
    
    func addSelectedPlayer(player: Player) -> Bool {
        if selectedPlayers.contains(player) {
            return false
        } else {
            selectedPlayers.append(player)
            return true
        }
    }
    
    func deleteSelectedPlayer(player: Player) {
        selectedPlayers = selectedPlayers.filter { $0 != player }
    }
    
    func deleteAllSelectedPlayers() {
        selectedPlayers = []
    }
}
