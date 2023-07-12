//
//  GameCollectionCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 04.07.2023.
//

import Foundation
import UIKit

final class GameCollectionCell: BaseDetailCollectionCell {
    var viewModel: GameCollectionCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            countLabel.text = viewModel.count
            nameLabel.text = viewModel.name
        }
    }
}
