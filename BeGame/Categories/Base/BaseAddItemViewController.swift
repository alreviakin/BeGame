//
//  AddItemViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class BaseAddItemViewController: UIViewController {
    var imageButton: UIButton = {
        let button = UIButton()
         button.setImage(UIImage(named: "pet"), for: .normal)
         button.layer.cornerRadius = 50
         button.layer.masksToBounds = true
         button.layer.borderWidth = 0.5
         button.layer.borderColor = R.NewPlayer.Color.border.cgColor
         button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
         return button
    }()
    var nameTextField: UITextField = {
       let textField = UITextField()
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure() {
        
    }
    
    func layout() {
        
    }
}

extension B
