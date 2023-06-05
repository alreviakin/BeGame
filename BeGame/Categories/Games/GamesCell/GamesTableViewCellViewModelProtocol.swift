//
//  GamesTableViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 01.06.2023.
//

import Foundation
import UIKit

protocol GamesTableViewCellViewModelProtocol {
    var name: String { get }
    var description: String { get }
    var image: UIImage { get }
}
