//
//  AddPlayerViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class AddPlayerViewController: BaseAddItemViewController {
    override func configure() {
        super.configure()
        titleLabel.text = "Игрок"
    }
}
