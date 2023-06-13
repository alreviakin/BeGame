//
//  PlayersTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation

class PlayerTableViewCell: BaseCategoryTableViewCell {
    var viewModel: PlayerTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.name
            itemImageView.image = viewModel.image
            descriptionLabel.text = viewModel.countGame
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageView.layer.cornerRadius = (contentView.bounds.height - 20) / 2
        descriptionLabel.snp.remakeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
