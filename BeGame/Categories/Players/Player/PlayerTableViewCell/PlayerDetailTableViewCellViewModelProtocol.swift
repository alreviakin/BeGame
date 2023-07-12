//
//  PlayerDetailTableViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

protocol PlayerDetailTableViewCellViewModelProtocol {
    var nameGame: String { get }
    
    var countGame: String { get }
    
    var countWinGame: String { get }
    
    var avaragePointGame: String { get }
    
    var bestPointGame: String { get }
}
