//
//  SignupView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class SignupNicknameView: BaseView {
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.Signup.pleaseEnterNickname
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    let nicknameInput = msInput(status: InactiveInput()).then {
        $0.placeholder = I18NStrings.Signup.nicknameInputPlaceholder
        $0.font = .Title4_R14
        $0.keyboardType = .numberPad
    }
    let nextButton = msButton(status: DisableButton()).then {
        $0.setTitle(I18NStrings.Signup.nextButtonTitle, for: .normal)
    }
    override func setupUI() {
        super.setupUI()
        addSubviews(guideLabel, nicknameInput, nextButton)
    }
    override func setConstraints() {
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        nicknameInput.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(nextButton.snp.top).offset(-32)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nicknameInput.snp.top).offset(-40)
        }
    }
}
