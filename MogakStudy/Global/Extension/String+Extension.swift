//
//  String+Extension.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/08.
//

import UIKit

extension String {
    var localized: String {
        Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }

    func localized(arguments: CVarArg...) -> String{
        String(format: self.localized, arguments: arguments)
    }
}
