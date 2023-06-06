//
//  AddGamesViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 06.06.2023.
//

import Foundation

class AddGamesViewModel: AddGamesViewModelProtocol {
    var selectedTypeGame: String?
    
    var lastIndexPath: IndexPath?
    
    var gameTypes: [String] = ["Кооператив", "Дуэль","Пати","Карточные","Набор очков","Скрытая роль"]
    
    func getString(for indexPath: IndexPath) -> String {
        gameTypes[indexPath.row]
    }
    
    func nuberOfRows() -> Int {
        return gameTypes.count
    }
    
    func setSelectedTypeGame(for indexPath: IndexPath) {
        selectedTypeGame = gameTypes[indexPath.row]
    }
}
