//
//  AddPlayerViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class AddPlayerViewController: BaseAddItemViewController {
    
    weak var delegate: PlayersCategoryViewControllerDelegate?
    
    override func configure() {
        super.configure()
        titleLabel.text = "Игрок"
        nameTextField.placeholder = "Введите имя игрока"
    }
}

extension AddPlayerViewController {
    override func save() {
        guard let name = nameTextField.text, let image = imageItem else {
            presentAlert(with: "Введите имя!")
            return
        }
        let username = name + "\(((name.hash / 10_000_000 + Int.random(in: 0...1_000_000)) * Int.random(in: -200...4000)) / 1000)"
        let player = PlayerStruct(name: name,
                                  username: username,
                                  image: image)
        delegate?.savePlayer(player: player)
        dismiss(animated: true)
    }
}
