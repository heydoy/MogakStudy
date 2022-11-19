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
    struct Home {
        static let whole = "whole".localized
    }
    struct MyInfo {
        // 내정보
        static let notice = "notice".localized
        static let faq = "faq".localized
        static let qna = "qna".localized
        static let alertSetting = "alertSetting".localized
        static let permit = "permit".localized
        
        // 정보관리
        static let infoManagement = "infoManagement".localized
        static let save = "save".localized
        static let myGender = "myGender".localized
        static let studyAlot = "studyAlot".localized
        static let pleaseEnterStudyPlaceholder = "pleaseEnterStudyPlaceholder".localized
        static let allowSearchMynumber = "allowSearchMynumber".localized
        static let ageSpan = "ageSpan".localized
        static let withdraw = "withdraw".localized
        
        // 펼쳐졌을 때 내용
        static let sesacTitle = "sesacTitle".localized
        static let goodManner = "goodManner".localized
        static let punctuality = "punctuality".localized
        static let fastResponse = "fastResponse".localized
        static let kindPersonality = "kindPersonality".localized
        static let proficiency = "proficiency".localized
        static let beneficialTime = "beneficialTime".localized
        
        static let sesacReview = "sesacReview".localized
        static let waitingForFirstReviewPlaceholder = "waitingForFirstReviewPlaceholder".localized
    }
}
