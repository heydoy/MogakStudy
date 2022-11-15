//
//  SignupGenderView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class SignupGenderView: BaseView {
    let guideLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
        $0.text = I18NStrings.Signup.pleaseSelectGener
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    let subGuideLabel = UILabel().then {
        $0.font = .Title2_R16
        $0.textColor = .msColor.gray007
        $0.text = I18NStrings.Signup.neededToFindSesac
    }
    var stackView = UIStackView()
    let maleButton = UIButton().then {
        $0.clipsToBounds = true
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 14)
        config.imagePadding = 2
        config.image = UIImage(named: "male")
        config.imagePlacement = .top
        config.title = I18NStrings.Signup.male
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .msColor.black
        config.titleAlignment = .center
        $0.configuration = config
        $0.layer.borderColor = UIColor.msColor.gray003.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 8
    }
    let femaleButton = UIButton().then {
        $0.clipsToBounds = true
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 14)
        config.imagePadding = 2
        config.image = UIImage(named: "female")
        config.imagePlacement = .top
        config.title = I18NStrings.Signup.female
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .msColor.black
        config.titleAlignment = .center
        $0.configuration = config
        $0.layer.borderColor = UIColor.msColor.gray003.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 8
    }
    let nextButton = msButton(status: DisableButton()).then {
        $0.setTitle(I18NStrings.Signup.nextButtonTitle, for: .normal)
    }
    
    override func setupUI() {
        super.setupUI()
        stackView.addArangedSubviews(maleButton, femaleButton)
        addSubviews(guideLabel, subGuideLabel, stackView, nextButton)
        
        // 스택뷰 설정
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
    }
    
    override func setConstraints() {
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(340)
        }
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(120)
            make.bottom.equalTo(nextButton.snp.top).offset(-32)
        }
        subGuideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top).offset(-32)
        }
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(subGuideLabel.snp.top).offset(-8)
        }
    }
    
    
}
