//
//  PlayGameTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation
import UIKit

class PlayGameTableViewCell: UITableViewCell {
    var viewModel: PlayGameTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.namePlayer
            if GameType(rawValue: viewModel.gameType ?? "") == .scoring {
                contentView.addSubview(textField)
            }
        }
    }
    
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var textField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.Color.separator.cgColor
        textField.layer.masksToBounds = true
        textField.textAlignment = .center
        textField.text = "0"
        textField.delegate = self
        textField.keyboardType = .numberPad
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
        }
        if GameType(rawValue: viewModel?.gameType ?? "") == .scoring {
            textField.snp.makeConstraints { make in
                make.right.equalToSuperview().offset(-25)
                make.centerY.equalToSuperview()
                make.width.equalTo(90)
                make.height.equalTo(30)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        selectionStyle = .none
    }
}

extension PlayGameTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let viewModel, let textTextField = textField.text else { return false }
        if textTextField == "0" && string != "" {
            textField.text = ""
        }
        return viewModel.acceptableSymbolsArr.contains(string)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.text = "0"
        }
    }
}
