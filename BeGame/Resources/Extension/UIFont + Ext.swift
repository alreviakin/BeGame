//
//  UIFont + Ext.swift
//  BeGame
//
//  Created by Алексей Ревякин on 06.06.2023.
//
//
import UIKit
import Foundation

extension String {
    func sizeOfString(maxWidth: CGFloat, font: UIFont) -> CGSize {
        let tmp = NSMutableAttributedString(string: self, attributes:[NSAttributedString.Key.font: font])
        let limitSize = CGSize(width: maxWidth, height: CGFloat(MAXFLOAT))
        let contentSize = tmp.boundingRect(with: limitSize, options: .usesLineFragmentOrigin, context: nil)
        return contentSize.size
    }
}

