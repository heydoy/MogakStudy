//
//  String+Extension.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/08.
//

import UIKit

enum StringPolicy: String {
    case phoneNumber = #"^01([0|1])([0-9]{7,8})$"# // 01로 시작하는 10~11자리 숫자
    case code = #"\d{6}"# // 숫자 6자리
    case nickname = #"^(?=.*[a-z가-힣])[a-z가-힣]{1,10}$"# // 최소 1자리 최대 10자리
    case email = #"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$"# // 이메일
}

// 다국어
extension String {
    var localized: String {
        Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
    
    func localized(arguments: CVarArg...) -> String{
        String(format: self.localized, arguments: arguments)
    }
}

// 유효성 검사 로직
extension String {
    func isValidString(_ policy: StringPolicy) -> Bool {
        let regex = policy.rawValue
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
}

// 숫자에 패턴을 입혀 내보내는 메서드.
// - e.g. 휴대폰 패턴 "###-####-####"
extension String {
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
// 문자열을 첨자로 접근하기
extension String {
    subscript(value: Int) -> Character {
        self[index(at: value)]
    }
    
    subscript(value: NSRange) -> Substring {
        self[value.lowerBound..<value.upperBound]
    }
    
    subscript(value: CountableClosedRange<Int>) -> Substring {
        self[index(at: value.lowerBound)...index(at: value.upperBound)]
    }
    
    subscript(value: CountableRange<Int>) -> Substring {
        self[index(at: value.lowerBound)..<index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        self[..<index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        self[...index(at: value.upperBound)]
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        self[index(at: value.lowerBound)...]
    }
    
    
    func index(at offset: Int) -> String.Index {
        index(startIndex, offsetBy: offset)
    }
    
}
