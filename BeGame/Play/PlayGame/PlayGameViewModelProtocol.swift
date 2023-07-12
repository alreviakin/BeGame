//
//  PlayGameViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import Foundation

protocol PlayGameViewModelProtocol {
    var game: Game { get }
    
    var countTime: Int { get }
    
    var players: [Player] { get }
    
    var isWin: Bool { get set }
    
    var playersWin: [String]? { get }
    
    var scoredPoints: [String: Int32]? { get }
    
    init(game: Game, players: [Player])
    
    //MARK: - Collection
    
    func getGameImage() -> Data
    
    func updateTime() -> String
    
    func addTime(seconds: Int)
    
    func getPlayGameCollectionViewCellViewModel(for indexPath: IndexPath) -> PlayGameCollectionViewCellViewModel
    
    //MARK: - Table
    
    func numberOfRowsTable() -> Int
    
    func getPlayGameTableViewCellViewModel(for indexPath: IndexPath) -> PlayGameTableViewCellViewModelProtocol
    
    //MARK: - CoreData
    
    func getGameHistoryStruct() -> GameHistoryStruct
    
    func changePoints(for index: Int, with points: String)
    
    func getWinPlayer()
}
