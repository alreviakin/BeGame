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
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addItem() {
        
    }
}
