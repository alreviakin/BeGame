//
//  PlayerSelectionTableViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import UIKit

class PlayerSelectionTableViewController: BasePlayTableViewController {
    var viewModel: PlayerSelectionViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.updatePlayer()
        viewModel?.deleteAllSelectedPlayers()
        tableView.reloadData()
    }
    
    override func configure() {
        super.configure()
        navigationItem.title = "Выбереите игрока"
        tableView.register(PlayerSelectedTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsMultipleSelection = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(play))
    }
}

//MARK: UITableViewDataSource
extension PlayerSelectionTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PlayerSelectedTableViewCell, let cellViewModel = viewModel?.cellViewModel(for: indexPath) else {
            return UITableViewCell()
        }
        cell.viewModel = cellViewModel
        return cell
    }
}

//MARK: - Transition
extension PlayerSelectionTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let player = viewModel?.getPlayer(for: indexPath), let viewModel = viewModel else { return }
        if !viewModel.addSelectedPlayer(player: player) {
            viewModel.deleteSelectedPlayer(player: player)
        }
    }
    
    @objc func play() {
        let playGameViewModel = viewModel?.getPlayGameViewModel()
        let playGameViewController = PlayGameViewController()
        playGameViewController.viewModel = playGameViewModel
        navigationController?.pushViewController(playGameViewController, animated: true)
    }
}
