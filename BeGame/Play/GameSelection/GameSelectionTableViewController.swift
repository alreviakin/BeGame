//
//  GameSelectionTableViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import Foundation
import UIKit

class GameSelectionTableViewController: BasePlayTableViewController{
    var viewModel: GameSelectionViewModel = GameSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateGame()
        tableView.reloadData()
    }
    
    override func configure() {
        super.configure()
        navigationItem.title = "Выберите игру"
        tableView.register(GameTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension GameSelectionTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GameTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}
