//
//  UserCardReviewView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import SnapKit
import Then
import AloeStackView
import MogakStudyUIFramework

final class UserCardReviewView: UIView {

    let titleLabel = UILabel().then {
        $0.text = "새싹 리뷰"
        $0.font = .Title6_R12
        $0.textColor = .msColor.black
    }
    let reviewInput = UITextView().then {
        $0.text = "첫 리뷰를 기다리는 중이에요!"
        $0.isScrollEnabled = false
        $0.font = .Body3_R14
        $0.textColor = .msColor.gray006
        $0.isUserInteractionEnabled = false
        
    }
    
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
        reviewInput.translatesAutoresizingMaskIntoConstraints = false

        addSubviews(titleLabel, reviewInput)

    }
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            reviewInput.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewInput.trailingAnchor.constraint(equalTo: trailingAnchor),
            reviewInput.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UserCardReviewView: Tappable {

  public func didTapView() {
      print(#function)
  }
}
