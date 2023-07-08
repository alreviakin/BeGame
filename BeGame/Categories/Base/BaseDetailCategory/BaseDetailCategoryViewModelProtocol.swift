//
//  BaseDetailCategoryViewModelProtocol.swift
//  BeGame
//
//  Created by Алексей Ревякин on 04.07.2023.
//

import Foundation

protocol BaseDetailCategoryViewModelProtocol {
    var title: String { get }
    var imageData: Data { get }
    var nameStatistic: String { get }
    var countCollectionCell: Int { get }
}
