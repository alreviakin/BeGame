//
//  Resources.swift
//  BeGame
//
//  Created by Алексей Ревякин on 23.05.2023.
//

import Foundation
import UIKit

enum R {
    enum Color {
        static let blue = UIColor(hexString: "#339DAA")
        static let lightBlue = UIColor(hexString: "#339DAA", alpha: 0.75)
        static let lightYellow = UIColor(hexString: "#EBC16D")
        static let yellow = UIColor(hexString: "#FEBD3D")
        static let darkYellow = UIColor(hexString: "#D99220")
        
        static let brown = UIColor(hexString: "#CA8C5D")
        static let separator = UIColor(hexString: "#333333", alpha: 0.3)
    }
    
    enum TabBar {
        enum Image {
            static let main = UIImage(systemName: "house")!
            static let play = UIImage(systemName: "play")!
        }
    }
}
