//
//  UserCardTitleView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import SnapKit
import Then
import AloeStackView
import MogakStudyUIFramework

final class UserCardTitleView: UIView {

    let titleLabel = UILabel().then {
        $0.text = I18NStrings.MyInfo.sesacTitle
        $0.font = .Title6_R12
        $0.textColor = .msColor.black
    }
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    let firstStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    let secondStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    let thirdStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    let firstBtn = msButton(status: FillButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.goodManner, for: .normal)
        $0.setTitleColor(.msColor.white, for: .normal)
    }
    let secondBtn = msButton(status: InactiveButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.punctuality, for: .normal)
        $0.setTitleColor(.msColor.black, for: .normal)
    }
    let thirdBtn = msButton(status: InactiveButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.fastResponse, for: .normal)
        $0.setTitleColor(.msColor.black, for: .normal)
    }
    let fourthBtn = msButton(status: InactiveButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.kindPersonality, for: .normal)
        $0.setTitleColor(.msColor.black, for: .normal)
    }
    let fifthBtn = msButton(status: InactiveButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.proficiency, for: .normal)
        $0.setTitleColor(.msColor.black, for: .normal)
    }
    let sixthBtn = msButton(status: InactiveButton()).then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitle(I18NStrings.MyInfo.beneficialTime, for: .normal)
        $0.setTitleColor(.msColor.black, for: .normal)
    }
    

    
    let reviewLabel = UILabel()
    let reviewTextview = UITextView()
    
    public var switchDidChange: ((_ isOn: Bool) -> Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func configure() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        thirdStack.translatesAutoresizingMaskIntoConstraints = false
        
        firstBtn.translatesAutoresizingMaskIntoConstraints = false
        secondBtn.translatesAutoresizingMaskIntoConstraints = false
        thirdBtn.translatesAutoresizingMaskIntoConstraints = false
        fourthBtn.translatesAutoresizingMaskIntoConstraints = false
        fifthBtn.translatesAutoresizingMaskIntoConstraints = false
        sixthBtn.translatesAutoresizingMaskIntoConstraints = false

        addSubviews(titleLabel, stackView)
        stackView.addArangedSubviews(firstStack, secondStack, thirdStack)
        firstStack.addArangedSubviews(firstBtn, secondBtn)
        secondStack.addArangedSubviews(thirdBtn, fourthBtn)
        thirdStack.addArangedSubviews(fifthBtn, sixthBtn)
        
    }
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 112),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            thirdStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            thirdStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension UserCardTitleView: Tappable {

  public func didTapView() {
      print(#function)
  }
}
