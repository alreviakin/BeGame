//
//  PlayerViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 08.07.2023.
//

import Foundation
import UIKit

class PlayerViewController: BaseDetailCategoryViewController {
    private let collectionIdentifier = "ColletionCell"
    private let tableViewIdentifier = "TableCell"
    
    override func configure() {
        super.configure()
        navigationItem.title = viewModel?.title
        collectionView.register(PlayerCollectoionCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        tableView.register(PlayerDetailTableViewCell.self, forCellReuseIdentifier: tableViewIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        detailImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.width.height.equalTo(view.bounds.width * 0.33)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(20)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension PlayerViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel as? PlayerViewModel else { return UICollectionViewCell()}
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as? PlayerCollectoionCell, let cellViewModel = viewModel.getCollectionCellViewModel(for: indexPath)  else { return UICollectionViewCell()}
        cell.viewModel = cellViewModel
        return cell
    }
}

//MARK: - UITabelViewDataSource
extension PlayerViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel as? PlayerViewModel else { return UITableViewCell()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as? PlayerDetailTableViewCell, let cellViewModel = viewModel.getTableCellViewModel(for: indexPath) else { return UITableViewCell()}
        cell.viewModel = cellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel as? PlayerViewModel else { return 0 }
        return viewModel.numberOfRowsTable()
    }
}

//MARK: - UITableViewDelegate
extension PlayerViewController {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseDetailHeaderView()
        let headerViewModel = BaseDetailHeaderViewModel(name: "Игра")
        view.viewModel = headerViewModel
        return view
    }
}
