//
//  MyPageTitle.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/19.
//

import Foundation

enum MyPageTitle: Int, CaseIterable {
    case username = 0
    case noti
    case faq
    case qna
    case alert
    case terms
    
    var title: String {
        get {
            switch self {
            case .username: return "김새싹"
            case .noti: return I18NStrings.MyInfo.notice
            case .faq: return I18NStrings.MyInfo.faq
            case .qna: return I18NStrings.MyInfo.qna
            case .alert: return I18NStrings.MyInfo.alertSetting
            case .terms: return I18NStrings.MyInfo.permit
            }
        }
    }
    
    var image: String {
        get {
            switch self {
            case .username: return "profile_img"
            case .noti: return "notice"
            case .faq: return "faq"
            case .qna: return "qna"
            case .alert: return "setting_alarm"
            case .terms: return "permit"
            }
        }
    }
}
