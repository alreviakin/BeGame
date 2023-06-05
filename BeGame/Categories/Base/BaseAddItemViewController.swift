//
//  BaseAddItemViewContro.swift
//  BeGame
//
//  Created by Алексей Ревякин on 02.06.2023.
//

import Foundation
import UIKit
import Photos
import PhotosUI

class BaseAddItemViewController: UIViewController {
    var isPhotoLayoutRemake = false
    var imageItem: UIImage?
    lazy var imageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pet"), for: .normal)
        button.layer.cornerRadius = 50
        button.layer.masksToBounds = true
        button.layer.borderWidth = 0.5
        button.layer.borderColor = R.Color.separator.cgColor
        button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        return button
    }()
    lazy var nameTextField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = R.Color.separator.cgColor
        textField.placeholder = "Введите имя"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.delegate = self
        return textField
    }()
    var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = R.Color.blue
        return label
    }()
    private lazy var saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("Cохранить", for: .normal)
        button.setTitleColor(R.Color.yellow, for: .normal)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()
    private lazy var cancelButton: UIButton = {
       let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(R.Color.yellow, for: .normal)
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
    }
    
    func configure() {
        view.backgroundColor = .white
        
        view.addSubview(imageButton)
        view.addSubview(nameTextField)
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        view.addSubview(titleLabel)
    }
    
    func layout() {
        saveButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-20)
        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.left.equalToSuperview().offset(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(saveButton)
        }
        imageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(imageButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
    }
}

@objc extension BaseAddItemViewController {
    func addItem(){
        let group = DispatchGroup()
        var isStatus = false
        group.enter()
        getPermissionIfNecessary {status in
            isStatus = status
            group.leave()
        }
        group.notify(queue: .main) {
            guard isStatus else { return }
            var config = PHPickerConfiguration(photoLibrary: .shared())
            config.selectionLimit = 1
            config.filter = .images
            let vc = PHPickerViewController(configuration: config)
            vc.delegate = self
            self.present(vc, animated: true)
        }
    }
    
    func save() {
    }
    
    private func cancel() {
        dismiss(animated: true)
    }
}

extension BaseAddItemViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let group = DispatchGroup()
        group.enter()
        
        results.forEach {[weak self] result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { result, error in
                defer {
                    group.leave()
                }
                guard let image = result as? UIImage, error == nil else { return }
                self?.imageItem = image
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.imageButton.setImage(self.imageItem, for: .normal)
            if !self.isPhotoLayoutRemake {
                self.imageButton.imageView?.snp.makeConstraints({ make in
                    make.edges.equalTo(self.imageButton.snp.edges)
                })
                self.isPhotoLayoutRemake = true
            }
        }
    }
    
    func getPermissionIfNecessary(completionHandler: @escaping (Bool)->Void) {
        guard PHPhotoLibrary.authorizationStatus() != .authorized else {
          completionHandler(true)
          return
        }
        
        PHPhotoLibrary.requestAuthorization { status in
            completionHandler(status == .authorized)
        }
    }
}

extension BaseAddItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
