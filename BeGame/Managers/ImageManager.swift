//
//  ImageManager.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

class ImageManager {
    static let shared = ImageManager()
    
    func getImage(name: String) -> UIImage {
        if let image = UIImage(named: name) {
            return image
        } else if let image = UIImage(systemName: name) {
            return image
        } else {
            return UIImage()
        }
    }
}
