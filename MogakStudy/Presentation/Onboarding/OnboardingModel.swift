//
//  OnboardingModel.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation

struct OnboardingModel {
    let imageName: String
    let title: String
    let attributedTitle: String
}

extension OnboardingModel {
    static let list: [OnboardingModel] = [
        OnboardingModel(imageName: "onboarding_img1",
                        title: I18NStrings.Onboarding.firstComment,
                        attributedTitle: I18NStrings.Onboarding.attributedFirstComment),
        OnboardingModel(imageName: "onboarding_img2",
                        title: I18NStrings.Onboarding.secondComment,
                        attributedTitle: I18NStrings.Onboarding.attributedSecondComment),
        OnboardingModel(imageName: "onboarding_img3",
                        title: I18NStrings.Onboarding.thirdComment,
                        attributedTitle: ""),
    ]
    
}
