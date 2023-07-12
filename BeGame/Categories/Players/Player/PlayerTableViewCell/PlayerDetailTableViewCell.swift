//
//  PlayerDetailTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation
import UIKit

class PlayerDetailTableViewCell: BaseDetailTableViewCell {
    var viewModel: PlayerDetailTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.nameGame
            gameLabel.text = viewModel.countGame
            winLabel.text = viewModel.countWinGame
            averagePointLabel.text = viewModel.avaragePointGame
            bestPointLabel.text = viewModel.bestPointGame
        }
    }
}
