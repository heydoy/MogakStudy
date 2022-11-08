//
//  I18NStrings.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/08.
//

import Foundation

struct I18NStrings {
    struct Common {
        static let appName = "appName".localized
        static let ok = "ok".localized
        static let start = "start".localized
    }
    struct Onboarding {
        static let firstComment = "firstComment".localized
        static let secondComment = "secondComment".localized
    }
    struct SMSAuth {
        static let pleaseEnterPhoneNumber = "pleaseEnterPhoneNumber".localized
        static let phoneNumberInputPlaceholder = "phoneNumberInputPlaceholder".localized
        static let phoneNumberButtonTitle = "phoneNumberButtonTitle".localized
        static let authSMSSent = "AuthSMSSent".localized
        static let resendButtonTitle = "resendButtonTitle".localized
        static let authAndStartButtonTitle = "authAndStartButtonTitle".localized
    }
}
