//
//  StudyPreferrableView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import Then
import MogakStudyUIFramework

class StudyPreferrableView: UIView {
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
        $0.text = "자주 하는 스터디"
        $0.font = .Title4_R14
        $0.textColor = .msColor.black
    }
    private let studyTextField = msInput(status: ActiveInput()).then {
        $0.placeholder = "스터디를 입력해 주세요"
    }
    
    private func setUpViews() {
        setUpLabel()
        setUpStudyTextField()
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        addSubview(label)
    }
    
    private func setUpStudyTextField() {
        studyTextField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(studyTextField)
    }
    

    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            studyTextField.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: 24),
            studyTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            studyTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}



