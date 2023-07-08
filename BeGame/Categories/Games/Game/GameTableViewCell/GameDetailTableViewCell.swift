//
//  GameTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation
import UIKit

final class GameDetailTableViewCell: BaseDetailTableViewCell {
    
    var viewModel: GameDetailTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.namePlayer
            gameLabel.text = viewModel.countGame
            winLabel.text = viewModel.countWinGame
            averagePointLabel.text = viewModel.avaragePointGame
            bestPointLabel.text = viewModel.bestPointGame
        }
    }
}
