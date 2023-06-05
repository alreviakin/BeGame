//
//  AddGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class AddGameViewController: BaseAddItemViewController {
    override func configure() {
        super.configure()
        titleLabel.text = "Игра"
    }
}
