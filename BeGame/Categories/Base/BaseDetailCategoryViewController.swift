//
//  BaseDetailCategoryViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 20.06.2023.
//

import Foundation
import UIKit

class BaseDetailCategoryViewController: UIViewController {
    var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var countCollectionCell: Int = 1
    
    lazy var collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize(width: (Int(view.bounds.width) - 40) / countCollectionCell, height: 70)
        layer.minimumLineSpacing = 0
        layer.minimumInteritemSpacing = 0
        layer.sectionInset = UIEdgeInsets(top: 0,
                                          left: 0,
                                          bottom: 0,
                                          right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layer)
        collection.isScrollEnabled = false
//        collection.dataSource = self
        return collection
    }()
    
    var nameStatisticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = R.Color.blue
        label.textAlignment = .center
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.backgroundColor = .white
        
        view.addSubview(detailImageView)
        view.addSubview(collectionView)
        view.addSubview(nameStatisticLabel)
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        detailImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.width.height.equalTo(view.bounds.width * 0.33)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(70)
        }
        nameStatisticLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameStatisticLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension BaseDetailCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
