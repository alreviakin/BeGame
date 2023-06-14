//
//  PlayGameCollectionViewCellViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation
import UIKit

protocol PlayGameCollectionViewCellViewModelProtocol {
    var nameLabel: String { get }
    var images: [UIImage] { get }
    var isTimerPlay: Bool { get set }
}
