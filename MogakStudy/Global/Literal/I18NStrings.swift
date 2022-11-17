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
        static let cancel = "cancel".localized
    }
    struct Onboarding {
        static let firstComment = "firstComment".localized
        static let secondComment = "secondComment".localized
        static let thirdComment = "thirdComment".localized
        
        static let attributedFirstComment = "attributedFirsteComment".localized
        static let attributedSecondComment = "attributedSecondComment".localized
        
        static let startButtonTitle = "startButtonTitle".localized
    }
    struct SMSAuth {
        static let pleaseEnterPhoneNumber = "pleaseEnterPhoneNumber".localized
        static let phoneNumberInputPlaceholder = "phoneNumberInputPlaceholder".localized
        static let phoneNumberButtonTitle = "phoneNumberButtonTitle".localized
        static let authSMSSent = "AuthSMSSent".localized
        static let authCodeInputPlaceholder = "authCodeInputPlaceholder".localized
        static let resendButtonTitle = "resendButtonTitle".localized
        static let authAndStartButtonTitle = "authAndStartButtonTitle".localized
    }
    struct Signup {
        static let nextButtonTitle = "nextButtonTitle".localized

        static let pleaseEnterNickname = "pleaseEnterNickname".localized
        static let nicknameInputPlaceholder = "nicknameInputPlaceholder".localized
        
        static let pleaseEnterBirthday = "pleaseEnterBirthday".localized
        static let year = "year".localized
        static let month = "month".localized
        static let day = "day".localized
        
        static let pleaseEnterEmail = "pleaseEnterEmail".localized
        static let neededToChangePhoneNumber = "neededToChangePhoneNumber".localized
        static let emailInputPlaceholer = "emailInputPlaceholer".localized
        
        static let pleaseSelectGener = "pleaseSelectGener".localized
        static let neededToFindSesac = "neededToFindSesac".localized
        static let male = "male".localized
        static let female = "female".localized
    }
    struct TabBar {
        static let homeTab = "homeTab".localized
        static let shopTab = "shopTab".localized
        static let friendTab = "friendTab".localized
        static let mypageTab = "mypageTab".localized
        
    }
}
