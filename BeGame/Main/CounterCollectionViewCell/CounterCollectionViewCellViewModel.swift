//
//  CounterCollectionViewCellViewModel.swift
//  BeGame
//
//  Created by Алексей Ревякин on 30.05.2023.
//

import Foundation
import UIKit

enum Counter: Int {
    case party
    case hours
    case days
}

class CounterCollectionViewCellViewModel: CounterCollectionViewCellViewModelProtocol {
    var nameCounter: String {
        switch counter {
        case .party:
            return "партий"
        case .hours:
            return "часов"
        case .days:
            return "дней"
        }
    }
    
    var count: String {
        switch counter {
        case .party:
            return "100"
        case .hours:
            return "100"
        case .days:
            return "100"
        }
    }
    
    var color: UIColor {
        switch counter {
        case .party:
            return R.Color.lightYellow
        case .hours:
            return R.Color.yellow
        case .days:
            return R.Color.darkYellow
        }
    }
    
    var counter: Counter
    
    init(counter: Counter) {
        self.counter = counter
    }
}
