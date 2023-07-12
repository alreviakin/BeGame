//
//  PlayerCollectionCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation

class PlayerCollectoionCell: BaseDetailCollectionCell {
    var viewModel: PlayerCollectionCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            countLabel.text = viewModel.count
            nameLabel.text = viewModel.name
        }
    }
}
