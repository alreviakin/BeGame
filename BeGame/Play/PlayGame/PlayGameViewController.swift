//
//  PlayGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import UIKit

class PlayGameViewController: UIViewController {
    var viewModel: PlayGameViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = viewModel?.game.name
        viewModel?.players.forEach {
            print($0.name)
        }
    }
}
