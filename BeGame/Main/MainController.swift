//
//  MainController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 23.05.2023.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width * 0.2, height: 55)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.register(CounterCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collection.isScrollEnabled = false
        return collection
    }()
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        layout()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = "BeGame"
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: R.Color.blue]
        
        view.addSubview(collection)
        view.addSubview(tableView)
    }
    
    private func layout() {
        collection.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.bounds.width * 0.7)
            make.height.equalTo(55)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(collection.snp.bottom).offset(10)
        }
    }
}


//MARK: UICollectionViewDataSource
extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CounterCollectionViewCell, let counter = Counter(rawValue: indexPath.row) else {
            return UICollectionViewCell()
        }
        let viewModel = CounterCollectionViewCellViewModel(counter: counter)
        cell.viewModel = viewModel
        return cell
    }
}

//MARK: UITableViewDataSource
extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? CategoryTableViewCell,
         let category = Category(rawValue: indexPath.row) else { return UITableViewCell()}
        let viewModel = CategoryTableViewCellViewModel(category: category)
        cell.viewModel = viewModel
        return cell
    }
}

//MARK: UITableViewDelegate
extension MainController: UITableViewDelegate {
    
}

