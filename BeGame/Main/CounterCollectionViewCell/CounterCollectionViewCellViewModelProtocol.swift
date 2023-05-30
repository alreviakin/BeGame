//
//  CounterCollectionViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

protocol CounterCollectionViewCellViewModelProtocol {
    var nameCounter: String { get }
    var count: String { get }
    var color: UIColor { get }
}
