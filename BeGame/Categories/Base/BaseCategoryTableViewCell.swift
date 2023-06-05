//
//  BaseCategoryTableViewCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import UIKit

class BaseCategoryTableViewCell: UITableViewCell {
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    var nameLabel: UILabel = {
       let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = R.Color.brown
        return label
    }()
    let separator: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separator)
    }
    
    override func layoutSubviews() {
        itemImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(contentView.bounds.height - 20)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(itemImageView.snp.right).offset(10)
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview()
            make.height.equalTo(25)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalToSuperview().offset(-10)
        }
        separator.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview()
            make.height.equalTo(0.3)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }

}
