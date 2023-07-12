//
//  BaseDetailCollectionCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation
import UIKit

class BaseDetailCollectionCell: UICollectionViewCell {
    var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = R.Color.yellow
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(countLabel)
        contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
    }
}
