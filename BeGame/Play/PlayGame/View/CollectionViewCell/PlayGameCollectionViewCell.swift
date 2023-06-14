//
//  PlayGameCollectionViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation
import UIKit

class PlayGameCollectionViewCell: UICollectionViewCell {
    var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var viewModel: PlayGameCollectionViewCellViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel as? PlayGameCollectionViewCellViewModel else { return }
            if viewModel.isFirstSet {
                label.text = viewModel.nameLabel
                imageView.image = viewModel.images[0]
                viewModel.isFirstSet = false
            } else {
                imageView.image = viewModel.isTimerPlay ? viewModel.images[0] : viewModel.images[1]
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(contentView.bounds.height * 0.6)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(30)
        }
    }
    
    func setTextLabel(text: String) {
        label.text = text
    }
}
