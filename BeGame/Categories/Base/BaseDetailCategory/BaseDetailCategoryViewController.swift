//
//  BaseDetailCategoryViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 20.06.2023.
//

import Foundation
import UIKit

class BaseDetailCategoryViewController: UIViewController {
    var viewModel: BaseDetailCategoryViewModelProtocol?
    
    var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.itemSize = CGSize(width: (Int(view.bounds.width) - 40) / (viewModel?.countCollectionCell ?? 1), height: 70)
        layer.minimumLineSpacing = 0
        layer.minimumInteritemSpacing = 0
        layer.sectionInset = UIEdgeInsets(top: 0,
                                          left: 0,
                                          bottom: 0,
                                          right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layer)
        collection.isScrollEnabled = false
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    var nameStatisticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = R.Color.blue
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
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
        
        guard let viewModel else { return }
        if let image = UIImage(data: viewModel.imageData) {
            detailImageView.image = image
        } else {
            detailImageView.image = #imageLiteral(resourceName: "pet")
        }
        nameStatisticLabel.text = viewModel.nameStatistic
    }
    
    override func viewWillLayoutSubviews() {
//        detailImageView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            make.width.height.equalTo(view.bounds.width * 0.33)
//        }
        collectionView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(70)
        }
        nameStatisticLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(nameStatisticLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}


//MARK: - UICollectionViewDataSource
extension BaseDetailCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.countCollectionCell ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}


//MARK: - UITableViewDataSource
extension BaseDetailCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension BaseDetailCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
