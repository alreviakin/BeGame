//
//  AddGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit

class AddGameViewController: BaseAddItemViewController {
    
    let viewModel = AddGamesViewModel()
    
    weak var delegate: GamesCategoryViewControllerDelegate?
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 30)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 2
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(GameTypeCell.self, forCellWithReuseIdentifier: "CollectionCell")
        return collection
    }()
    
    override func configure() {
        super.configure()
        titleLabel.text = "Игра"
        view.addSubview(collection)
    }
    
    override func layout() {
        super.layout()
        collection.snp.makeConstraints { make in
            make.left.right.equalTo(nameTextField)
            make.top.equalTo(nameTextField.snp.bottom).offset(40)
            make.bottom.equalToSuperview()
        }
    }
}

extension AddGameViewController {
    override func save() {
        guard let name = nameTextField.text, let image = imageItem else {
            presentAlert(with: "Введите название игры")
            return
        }
        guard let typeString = viewModel.selectedTypeGame else {
            presentAlert(with: "Выберите тип игры")
            return
        }
        guard let type = GameType(rawValue: typeString) else {
            return
        }
        let game = GameStruct(name: name,
                              image: image,
                              type: type)
        delegate?.saveGame(game: game)
        dismiss(animated: true)
    }
}

//MARK: - UICollectionViewDataSource
extension AddGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nuberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? GameTypeCell else {return UICollectionViewCell()}
        cell.typeLabel.text = viewModel.getString(for: indexPath)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension AddGameViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = viewModel.getString(for: indexPath)
        return text.sizeOfString(maxWidth: view.bounds.width, font: UIFont.systemFont(ofSize: 28))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameTypeCell else { return }
        cell.isSelectedCell.toggle()
        if cell.isSelectedCell {
            viewModel.setSelectedTypeGame(for: indexPath)
        } else {
            viewModel.selectedTypeGame = nil
        }
        guard let lastIndexPath = viewModel.lastIndexPath else {
            viewModel.lastIndexPath = indexPath
            return
        }
        if lastIndexPath != indexPath {
            guard let lastCell = collectionView.cellForItem(at: lastIndexPath) as? GameTypeCell else { return }
            if lastCell.isSelectedCell {
                lastCell.isSelectedCell.toggle()
            }
            viewModel.lastIndexPath = indexPath
        }
    }
}


