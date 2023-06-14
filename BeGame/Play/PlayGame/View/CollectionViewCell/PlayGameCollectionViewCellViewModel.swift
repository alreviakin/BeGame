//
//  PlayGameCollectionViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 14.06.2023.
//

import Foundation
import UIKit

class PlayGameCollectionViewCellViewModel: PlayGameCollectionViewCellViewModelProtocol {
    
    var isTimerPlay: Bool = true
    
    var isFirstSet: Bool = true
    
    var nameLabel: String
    
    var images: [UIImage]
    
    init(nameLabel: String, images: [UIImage]) {
        self.nameLabel = nameLabel
        self.images = images
    }
}
