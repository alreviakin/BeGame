//
//  CounterCollectionViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import UIKit

class CounterCollectionViewCell: UICollectionViewCell {
    
    private var countLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private var counterNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var viewModel: CounterCollectionViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            countLabel.text = viewModel.count
            counterNameLabel.text = viewModel.nameCounter
            counterNameLabel.textColor = viewModel.color
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
        contentView.addSubview(countLabel)
        contentView.addSubview(counterNameLabel)
    }
    
    override func layoutSubviews() {
        countLabel.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(contentView.bounds.height / 2)
        }
        counterNameLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(countLabel.snp.bottom)
        }
    }
}
