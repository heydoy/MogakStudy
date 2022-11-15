//
//  VerifySMSView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class VerifySMSView: BaseView {
    
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.SMSAuth.authSMSSent
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let codeInput = msInput(status: InactiveInput()).then {
        $0.placeholder = I18NStrings.SMSAuth.authCodeInputPlaceholder
        $0.font = .Title4_R14
        $0.keyboardType = .numberPad
    }
    
    let timerLabel = UILabel().then {
        $0.font = .Title3_M14
        $0.textColor = .msColor.brandGreen
    }
    
    let resendButton = msButton(status: FillButton()).then {
        $0.setTitle(I18NStrings.SMSAuth.resendButtonTitle, for: .normal)
    }
    
    let verifyCodeButton = msButton(status: DisableButton()).then {
        $0.setTitle(I18NStrings.SMSAuth.authAndStartButtonTitle, for: .normal)
    }
    
    override func setupUI() {
        super.setupUI()
        addSubviews(guideLabel, codeInput, verifyCodeButton)
    }
    
    override func setConstraints() {
        
        verifyCodeButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        codeInput.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(verifyCodeButton.snp.top).offset(-32)
        }
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(codeInput.snp.top).offset(-40)
        }
    }

}
