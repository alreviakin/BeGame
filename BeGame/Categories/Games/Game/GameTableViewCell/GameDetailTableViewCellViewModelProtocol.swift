//
//  GameDetailTableViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation

protocol GameDetailTableViewCellViewModelProtocol {
    var namePlayer: String { get }
    var countGame: String { get }
    var countWinGame: String { get }
    var avaragePointGame: String { get }
    var bestPointGame: String { get }
}
