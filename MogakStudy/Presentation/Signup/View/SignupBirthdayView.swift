//
//  SignupBirthdayView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class SignupBirthdayView: BaseView {
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.Signup.pleaseEnterBirthday
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    var stackView = UIStackView()
    var yearStackView = UIStackView()
    var monthStackView = UIStackView()
    var dayStackView = UIStackView()
    
    let birthYInput = msInput(status: ActiveInput()).then {
        $0.placeholder = "1990"
        $0.font = .Title4_R14
        $0.isUserInteractionEnabled = false
    }
    let yearLabel = UILabel().then {
        $0.text = I18NStrings.Signup.year
        $0.font = .Title2_R16
    }
    let birthMInput = msInput(status: ActiveInput()).then {
        $0.placeholder = "1"
        $0.font = .Title4_R14
        $0.isUserInteractionEnabled = false
    }
    let monthLabel = UILabel().then {
        $0.text = I18NStrings.Signup.month
        $0.font = .Title2_R16
    }
    let birthDInput = msInput(status: ActiveInput()).then {
        $0.placeholder = "1"
        $0.font = .Title4_R14
        $0.isUserInteractionEnabled = false
    }
    let dayLabel = UILabel().then {
        $0.text = I18NStrings.Signup.day
        $0.font = .Title2_R16
    }
    
    let datePicker = UIDatePicker().then {
        $0.locale = Locale(identifier: "ko-KR")
        $0.preferredDatePickerStyle = .wheels
        $0.datePickerMode = .date
        $0.becomeFirstResponder()
        
        var components = DateComponents()
        components.year = 1990
        components.month = 1
        components.day = 1
        
        $0.date = Calendar(identifier: .gregorian).date(from: components)!
    }
    
    let nextButton = msButton(status: FillButton()).then {
        $0.setTitle(I18NStrings.Signup.nextButtonTitle, for: .normal)
    }
    
    override func setupUI() {
        super.setupUI()
        
        yearStackView.addArangedSubviews(birthYInput, yearLabel)
        monthStackView.addArangedSubviews(birthMInput, monthLabel)
        dayStackView.addArangedSubviews(birthDInput, dayLabel)
        
        stackView.addArangedSubviews(
            yearStackView, monthStackView, dayStackView
        )
        
        addSubviews(guideLabel, stackView, nextButton, datePicker)
        
        // 스택뷰 설정
        stackView.spacing = 23
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        // 작은 스택뷰 설정
        [ yearStackView, monthStackView, dayStackView ].forEach {
            $0.spacing = 4
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
        }
    }
    
    override func setConstraints() {
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(nextButton.snp.top).offset(-32)
        }
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top).offset(-40)
        }
        
        datePicker.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
