//
//  PlayersTableViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

protocol PlayerTableViewCellViewModelProtocol {
    var name: String { get }
    var countGame: String { get }
    var image: UIImage { get }
    
}
