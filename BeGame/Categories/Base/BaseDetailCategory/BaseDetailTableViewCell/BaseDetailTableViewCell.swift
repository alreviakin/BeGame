//
//  BaseDetailTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation
import UIKit

class BaseDetailTableViewCell: UITableViewCell {
    var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    var gameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    var winLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    var averagePointLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    var bestPointLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var horizontalStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: labelViews)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    lazy var labelViews: [UILabel] = [gameLabel, winLabel, averagePointLabel, bestPointLabel]
    var separator: UIView = {
       let view = UIView()
        view.backgroundColor = R.Color.separator
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(horizontalStack)
        contentView.addSubview(separator)
    }
    
    override func layoutSubviews() {
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(90)
        }
        horizontalStack.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.left.equalTo(nameLabel.snp.right).offset(50)
            make.top.bottom.equalToSuperview()
        }
        separator.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.bottom.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        gameLabel.text = nil
        winLabel.text = nil
        averagePointLabel.text = nil
        bestPointLabel.text = nil
    }
}
