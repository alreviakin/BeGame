//
//  CategoryTableViewViewModelCell.swift
//  BeGame
//
//  Created by Алексей Ревякин on 28.05.2023.
//

import Foundation
import UIKit

enum Category: Int {
    case players
    case games
    case planed
    case notes
    case favourites
}

class CategoryTableViewCellViewModel: CategoryTableViewCellViewModelProtocol {
    private var category: Category
    
    var imageString: String {
        switch category {
        case .players:
            return "person"
        case .games:
            return "board-game"
        case .planed:
            return "calendar"
        case .notes:
            return "square.and.pencil"
        case .favourites:
            return "bookmark"
        }
    }

    var categoryName: String {
        switch category {
        case .players:
            return "Игроки"
        case .games:
            return "Игры"
        case .planed:
            return "Запланированные"
        case .notes:
            return "Заметки"
        case .favourites:
            return "Избранное"
        }
    }

    init(category: Category) {
        self.category = category
    }
}
