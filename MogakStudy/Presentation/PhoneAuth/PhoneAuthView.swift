//
//  PhoneAuthView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class PhoneAuthView: BaseView {
    
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.SMSAuth.pleaseEnterPhoneNumber
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let phoneInput = msInput(status: InactiveInput()).then {
        $0.placeholder = I18NStrings.SMSAuth.phoneNumberInputPlaceholder
        $0.font = .Title4_R14
        $0.keyboardType = .numberPad
    }
    
    let getCodeButton = msButton(status: DisableButton()).then {
        $0.setTitle(I18NStrings.SMSAuth.phoneNumberButtonTitle, for: .normal)
    }
    
    override func setupUI() {
        super.setupUI()
        addSubviews(guideLabel, phoneInput, getCodeButton)
    }
    
    override func setConstraints() {
        
        
        getCodeButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        phoneInput.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(getCodeButton.snp.top).offset(-32)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(phoneInput.snp.top).offset(-40)
        }
    }

}
