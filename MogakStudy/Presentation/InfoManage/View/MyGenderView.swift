//
//  MyGenderView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class MyGenderView: UIView {
    // MARK: Lifecycle
    
    public init() {
        super.init(frame: .zero)
        setUpViews()
        setUpConstraints()
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    
    public var gender: Int {
        get {
            femaleButton.isSelected ? 0 : 1
        }
    }
    
    
    // MARK: Private
    
    private let label = UILabel().then {
        $0.text = "내 성별"
        $0.font = .Title4_R14
        $0.textColor = .msColor.black
        
    }
    private let maleButton = msButton(status: InactiveButton()).then {
        $0.setTitle("남자", for: .normal)
        $0.titleLabel?.font = .Body3_R14
    }
    private let femaleButton = msButton(status: FillButton()).then {
        $0.setTitle("여자", for: .normal)
        $0.titleLabel?.font = .Body3_R14
        $0.isSelected = true
    }
    
    private func setUpViews() {
        setUpLabel()
        setUpSwitchView()
        
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        addSubview(label)
    }
    
    private func setUpSwitchView() {
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(maleButton)
        addSubview(femaleButton)
        
        maleButton.addTarget(self, action: #selector(genderButtonTapped), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(genderButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func genderButtonTapped(_ sender: UIButton) {
        if sender.isSelected { return }
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            if sender == femaleButton {
                maleButton.isSelected = false
            } else {
                femaleButton.isSelected = false
            }
        }
        
        [maleButton, femaleButton].forEach {
            let status: ButtonStatusColor  = $0.isSelected ? FillButton() : InactiveButton()
            $0.backgroundColor = status.backgroundColor
            $0.layer.borderColor = status.borderColor
            $0.setTitleColor(status.titleColor, for: .normal )
        }

    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            maleButton.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: 2),
            maleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            maleButton.heightAnchor.constraint(equalToConstant: 48),
            maleButton.widthAnchor.constraint(equalToConstant: 56),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 8),
            femaleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            femaleButton.heightAnchor.constraint(equalToConstant: 48),
            femaleButton.widthAnchor.constraint(equalToConstant: 56),
            femaleButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

