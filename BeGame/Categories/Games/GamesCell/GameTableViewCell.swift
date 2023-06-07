//
//  GamesTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

class GameTableViewCell: BaseCategoryTableViewCell {
    private var countGameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = R.Color.brown
        label.text = "20 games"
        return label
    }()
    
    var viewModel: GameTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.name
            descriptionLabel.text = viewModel.description
            itemImageView.image = viewModel.image
        }
    }
    
    override func configure() {
        super.configure()
        contentView.addSubview(countGameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countGameLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        descriptionLabel.snp.remakeConstraints { make in
            make.right.equalTo(countGameLabel.snp.left).offset(-5)
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
