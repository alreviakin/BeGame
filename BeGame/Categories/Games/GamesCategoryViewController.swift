//
//  GamesCategoryViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import UIKit

protocol GamesCategoryViewControllerDelegate: AnyObject {
    func saveGame(game: GameStruct)
}

final class GamesCategoryViewController: BaseCategoryViewController {
    var viewModel: GamesCategoryViewControllerViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        super.configure()
        tableView.register(GameTableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "Игры"
        
    }
}

extension GamesCategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRow() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GameTableViewCell,
              let viewModel else { return UITableViewCell()}
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}


//MARK: - Transition
extension GamesCategoryViewController {
    override func addItem() {
        let vc = AddGameViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension GamesCategoryViewController: GamesCategoryViewControllerDelegate {
    func saveGame(game: GameStruct) {
        viewModel?.saveGame(game: game)
        tableView.reloadData()
    }
}
