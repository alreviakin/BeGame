//
//  PlayGameViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import Foundation

protocol PlayGameViewModelProtocol {
    var game: Game { get }
    var players: [Player] { get }
    init(game: Game, players: [Player])
}
