//
//  CategoryTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 28.05.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        return imageView
    }()
    
    private var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var viewModel: CategoryTableViewCellViewModelProtocol? {
        didSet {
            guard let viewModel else { return }
            categoryImageView.image = ImageManager.shared.getImage(name: viewModel.imageString)
            categoryNameLabel.text = viewModel.categoryName
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryNameLabel)
    }
    
    override func layoutSubviews() {
        categoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(contentView.bounds.height - 20)
        }
        categoryNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(categoryImageView)
            make.left.equalTo(categoryImageView.snp.right).offset(12)
        }
    }
    
    override func prepareForReuse() {
        categoryImageView.image = nil
        categoryNameLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
