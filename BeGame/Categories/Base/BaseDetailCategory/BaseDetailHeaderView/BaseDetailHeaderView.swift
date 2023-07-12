//
//  BaseDetailHeaderView.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.07.2023.
//

import Foundation
import UIKit

class BaseDetailHeaderView: UIView {
    
    var viewModel: BaseDetailHeaderViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.name
            gameLabel.text = viewModel.countGame
            winLabel.text = viewModel.winPercentGame
            averagePointLabel.text = viewModel.averagePoint
            bestPointLabel.text = viewModel.bestPoint
        }
    }
    
    var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    var gameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var winLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var averagePointLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var bestPointLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    lazy var horizontalStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: labelViews)
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()
    lazy var labelViews: [UILabel] = [gameLabel, winLabel, averagePointLabel, bestPointLabel]
    var separator: UIView = {
       let view = UIView()
        view.backgroundColor = R.Color.separator
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .white
        self.addSubview(nameLabel)
        self.addSubview(horizontalStack)
        self.addSubview(separator)
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
}
