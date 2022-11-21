//
//  AllowPhoneSearhView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

class AllowPhoneSearhView: UIView {
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
    
    public var text: String? {
        get { return label.text }
        set { label.text = newValue}
    }
    
    
    // MARK: Private
    
    private let label = UILabel().then {
        $0.text = I18NStrings.MyInfo.allowSearchMynumber
        $0.font = .Title4_R14
        $0.textColor = .msColor.black

    }
    private let switchView = UISwitch(frame: .zero).then {
        $0.onTintColor = .msColor.brandGreen
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
        switchView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(switchView)
    }
    

    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            switchView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            switchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            switchView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1)
        ])
    }
    
}

