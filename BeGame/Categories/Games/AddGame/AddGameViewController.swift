//
//  AddGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class AddGameViewController: BaseAddItemViewController {
    
    weak var delegate: GamesCategoryViewControllerDelegate?
    
    override func configure() {
        super.configure()
        titleLabel.text = "Игра"
    }
}

extension AddGameViewController {
    override func save() {
        guard let name = nameTextField.text, let image = imageItem else {
            presentAlert(with: "Введите название игры")
            return
        }
        let game = GameStruct(name: name,
                              image: image,
                              type: .card)
        delegate?.saveGame(game: game)
        dismiss(animated: true)
    }
}
