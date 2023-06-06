//
//  GameTypeCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 06.06.2023.
//

import Foundation
import UIKit

class GameTypeCell: UICollectionViewCell {
    var typeLabel: UILabel = {
       let label = UILabel()
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.textColor = R.Color.separator
        label.layer.borderColor = R.Color.separator.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    var isSelectedCell: Bool = false {
        didSet {
            
            if isSelectedCell {
                typeLabel.textColor = .white
                typeLabel.backgroundColor = R.Color.blue
            } else {
                typeLabel.textColor = R.Color.separator
                typeLabel.backgroundColor = .white
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(typeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        typeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
