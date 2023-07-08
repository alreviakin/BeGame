//
//  GameCollectionCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 04.07.2023.
//

import Foundation

class GameCollectionCellViewModel: GameCollectionCellViewModelProtocol {
    var count: String
    
    var name: String
    
    init(count: String, name: String) {
        self.count = count
        self.name = name
    }
}
