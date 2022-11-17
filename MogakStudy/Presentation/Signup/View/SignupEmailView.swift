//
//  SignupEmailView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class SignupEmailView: BaseView {
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.Signup.pleaseEnterNickname
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    let subGuideLabel = UILabel().then {
        $0.font = .Title2_R16
        $0.textColor = .msColor.gray007
        $0.text = I18NStrings.Signup.neededToChangePhoneNumber
    }
    let emailInput = msInput(status: InactiveInput()).then {
        $0.placeholder = I18NStrings.Signup.emailInputPlaceholer
        $0.font = .Title4_R14
        $0.keyboardType = .emailAddress
    }
    let nextButton = msButton(status: DisableButton()).then {
        $0.setTitle(I18NStrings.Signup.nextButtonTitle, for: .normal)
    }
    
    override func setupUI() {
        super.setupUI()
        addSubviews(guideLabel, subGuideLabel, emailInput, nextButton)
    }
    
    override func setConstraints() {
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        emailInput.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(nextButton.snp.top).offset(-32)
        }
        subGuideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailInput.snp.top).offset(-32)
        }
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(subGuideLabel.snp.top).offset(-8)
        }
    }
}
