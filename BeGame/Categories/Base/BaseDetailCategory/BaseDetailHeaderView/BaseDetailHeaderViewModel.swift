//
//  BaseDetailHeaderViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation

class BaseDetailHeaderViewModel: BaseDetailHeaderViewModelProtocol {
    var name: String
    
    var countGame: String = "Игры"
    
    var winPercentGame: String = "Поб%"
    
    var averagePoint: String = "Среднее"
    
    var bestPoint: String = "Лучшее"
    
    init(name: String) {
        self.name = name
    }
}
