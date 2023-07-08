//
//  BaseDetailHeaderViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation

protocol BaseDetailHeaderViewModelProtocol {
    var name: String { get }
    var countGame: String { get }
    var winPercentGame: String { get }
    var averagePoint: String { get }
    var bestPoint: String { get }
}
