//
//  Date+Extension.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation

extension Date {
    /// 날짜를 분리된 년,월,일로 보내줍니다.
    func dateToSeperateYMD() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let date = dateFormatter.string(from: self)
        
        let year = String(date[0...3])
        let month = String(date[4...5])
        let day = String(date[6...7])
        
        return [year, month, day]
    }
    
    /// 회원가입을 서버로 보낼 때 유효한 형태로 생년월일을 바꿔줍니다.
    func changeToValidBirthday() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let validDate = dateFormater.string(from: self)
        
        return validDate
    }
}
