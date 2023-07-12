//
//  PlayersCategoryViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

protocol PlayersCategoryViewControllerDelegate: AnyObject {
    func savePlayer(player: PlayerStruct)
}

class PlayersCategoryViewController: BaseCategoryViewController {
    var viewModel: PlayersCategoryViewControllerViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        super.configure()
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Игроки"
        
    }
}

//MARK: - TableViewDataSource
extension PlayersCategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PlayerTableViewCell,
         let viewModel else { return UITableViewCell() }
        if viewModel.isLastCell(for: indexPath) {
            cell.separator.isHidden = true
        }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}

//MARK: - TableViewDelegate
extension PlayersCategoryViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlayerViewController()
        let playerViewModel = viewModel?.getPlayerViewModel(for: indexPath)
        vc.viewModel = playerViewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Actions
extension PlayersCategoryViewController {
    override func addItem() {
        let vc = AddPlayerViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
}

//MARK: - PlayersCategoryViewControllerDelegate
extension PlayersCategoryViewController: PlayersCategoryViewControllerDelegate {
    func savePlayer(player: PlayerStruct) {
        viewModel?.savePlayer(player: player)
        tableView.reloadData()
    }
    
    
}
