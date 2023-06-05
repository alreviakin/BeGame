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
}
