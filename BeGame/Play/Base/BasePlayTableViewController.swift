//
//  BasePlayTableViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 07.06.2023.
//

import UIKit

class BasePlayTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = R.Color.yellow
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : R.Color.blue,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
