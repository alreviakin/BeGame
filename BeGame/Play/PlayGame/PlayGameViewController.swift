//
//  PlayGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import UIKit

class PlayGameViewController: UIViewController {
    var viewModel: PlayGameViewModelProtocol?
    private var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        
        return scroll
    }()
    private lazy var imageGame: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        guard let imageData = viewModel?.getGameImage() else { return imageView}
        imageView.image = UIImage(data: imageData)
        return imageView
    }()
    private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collection
    }()
    private lazy var playerTableView: UITableView = {
       let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.isScrollEnabled = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = viewModel?.game.name
        
        view.addSubview(scrollView)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDataSource
extension PlayGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension PlayGameViewController: UITableViewDelegate {
    
}
