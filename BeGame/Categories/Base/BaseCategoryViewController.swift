//
//  BaseViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import UIKit

class BaseCategoryViewController: UIViewController {
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.backgroundColor = .white
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationController?.navigationBar.tintColor = R.Color.yellow
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : R.Color.blue,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

@objc extension BaseCategoryViewController {
    func addItem() {
    }
}

extension BaseCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
