//
//  NSMutableAttributedString+Extension.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit

extension NSMutableAttributedString {

    func getAttributed(string: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let font = font
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}
