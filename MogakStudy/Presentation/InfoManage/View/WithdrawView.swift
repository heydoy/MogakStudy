//
//  WithdrawView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework
import AloeStackView

class WithdrawView: UIView {
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
        $0.text = I18NStrings.MyInfo.withdraw
        $0.font = .Title4_R14
        $0.textColor = .msColor.black
    
    }

    private func setUpViews() {
        setUpLabel()
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        addSubview(label)
    }

    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}
extension WithdrawView: Tappable {

  public func didTapView() {
      print("회원탈퇴")
  }
}
