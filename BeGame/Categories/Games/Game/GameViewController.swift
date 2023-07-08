//
//  GameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 20.06.2023.
//

import Foundation
import UIKit

final class GameViewController: BaseDetailCategoryViewController {
    private let collectionIdetifire = "collectionCell"
    private let tableViewIdentifire = "tableCell"
    private lazy var backgroundView: UIView = {
       let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 20
        bgView.layer.masksToBounds = true
        return bgView
    }()
    private var typeGameButton: UIButton = {
       let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.backgroundColor = R.Color.blue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        btn.isEnabled = false
        return btn
    }()
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textColor = R.Color.blue
        return label
    }()
    
    override func configure() {
        super.configure()
        guard let viewModel = viewModel as? GameViewModel else { return }
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        view.sendSubviewToBack(detailImageView)
        view.addSubview(typeGameButton)
        view.addSubview(nameLabel)
        detailImageView.layer.cornerRadius = 0
        collectionView.register(GameCollectionCell.self, forCellWithReuseIdentifier: collectionIdetifire)
        tableView.register(GameDetailTableViewCell.self, forCellReuseIdentifier: tableViewIdentifire)
        
        typeGameButton.setTitle(viewModel.gameType, for: .normal)
        nameLabel.text = viewModel.title
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        detailImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(280)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.bottom).offset(-70)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        typeGameButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(backgroundView.snp.top).offset(-10)
            make.height.equalTo(30)
        }
        typeGameButton.titleLabel?.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(typeGameButton)
//            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundView.snp.top).offset(15)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
    }
}

//MARK: - UICollectionViewDatatSource
extension GameViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel as? GameViewModel else { return UICollectionViewCell() }
        guard let cellViewModel = viewModel.getCollectionCellViewModel(for: indexPath) else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdetifire, for: indexPath) as? GameCollectionCell else {
            return UICollectionViewCell()}
        cell.viewModel = cellViewModel
        return cell
    }
}

//MARK: - UITableViewDataSource
extension GameViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel as? GameViewModel else { return 0 }
        return viewModel.numberOfRowsTable()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel as? GameViewModel else { return UITableViewCell() }
        guard let cellViewModel = viewModel.getTableCellViewModel(for: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifire, for: indexPath) as? GameDetailTableViewCell else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseDetailHeaderView()
        let headerViewModel = BaseDetailHeaderViewModel(name: "Игрок")
        view.viewModel = headerViewModel
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
