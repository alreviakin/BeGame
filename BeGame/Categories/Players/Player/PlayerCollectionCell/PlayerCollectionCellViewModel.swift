//
//  PlayerCollectionCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

class PlayerCollectionCellViewModel: PlayerCollectionCellViewModelProtocol {
    var count: String
    
    var name: String
    
    init(name: String, count: String) {
        self.count = count
        self.name = name
    }
}
