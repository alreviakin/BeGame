//
//  PlayGameTableViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation

protocol PlayGameTableViewCellViewModelProtocol {
    var namePlayer: String { get }
    
    var character: String? { get }
    
    var gameType: String? { get }
    
    var points: Int? { get }
    
    var acceptableSymbolsArr: [String] { get }
    
    func setGameType(gameType: String) 
    
    func setCharacter(character: String) 
}
