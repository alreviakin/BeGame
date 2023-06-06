//
//  AddGamesViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 06.06.2023.
//

import Foundation

protocol AddGamesViewModelProtocol {
    var gameTypes: [String] { get }
    func getString(for indexPath: IndexPath) -> String
    func nuberOfRows() -> Int
    var lastIndexPath: IndexPath? { get set }
    var selectedTypeGame: String? { get }
    func setSelectedTypeGame(for indexPath: IndexPath)
}
