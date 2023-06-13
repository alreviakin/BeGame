//
//  PlaySelectedTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 10.06.2023.
//

import Foundation
import UIKit

class PlayerSelectedTableViewCell: PlayerTableViewCell {
//    override var intrinsicContentSize: CGSize {
//
//    }
    var isSelectedBtn: Bool = false
    private let selectedButton: UIButton = {
       let btn = UIButton()
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        btn.layer.borderColor = R.Color.separator.cgColor
        return btn
    }()
    
    override func configure() {
        super.configure()
        contentView.addSubview(selectedButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(30)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        guard selected else {
            selectedButton.setImage(nil, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.layer.borderColor = R.Color.separator.cgColor
            isSelectedBtn = false
            return
        }
        isSelectedBtn.toggle()
        if isSelectedBtn {
            selectedButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            selectedButton.backgroundColor = R.Color.lightBlue
            selectedButton.tintColor = .white
            selectedButton.layer.borderColor = UIColor.white.cgColor
        } else {
            selectedButton.setImage(nil, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.layer.borderColor = R.Color.separator.cgColor
        }
    }
    
    
}
