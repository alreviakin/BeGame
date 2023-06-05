//
//  GamesCategoryViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import UIKit

final class GamesCategoryViewController: BaseCategoryViewController {
    var viewModel: GamesCategoryViewControllerViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configure() {
        super.configure()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Игры"
        
    }
}

extension GamesCategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRow() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GamesTableViewCell,
              let viewModel else { return UITableViewCell()}
        if viewModel.isLastCell(for: indexPath) {
            cell.separator.isHidden = true
        }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}


//MARK: - Transition
extension GamesCategoryViewController {
    override func addItem() {
        let vc = AddGameViewController()
        present(vc, animated: true)
    }
}
