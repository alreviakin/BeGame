//
//  GameHistoryStruct.swift
//  BeGame
//
//  Created by Алексей Ревякин on 18.06.2023.
//

import Foundation

struct GameHistoryStruct {
    var date: Date
    var gameName: String
    var isWin: Bool
    var playerUsernames: [String]
    var playerWinUsername: [String]?
    var scoredPoints: [String: Int32]?
    var time: Int32
}
