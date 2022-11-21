//
//  UserCardRV.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/20.
//

import UIKit
import SnapKit
import Then
import AloeStackView
import MogakStudyUIFramework

final class UserCardView: UIView {

    let detailView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.msColor.gray002.cgColor
    }
    let userNameLabel = UILabel().then {
        $0.text = "김새싹"
        $0.font = .Title1_M16
        $0.textColor = .msColor.black
    }
    let switchButton = UIButton().then {
        $0.setImage(UIImage(named: "more_arrow_down"), for: .normal)
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
        addSubviews(userNameLabel, switchButton)
        switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .touchUpInside)
        
    }
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: topAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            switchButton.leadingAnchor.constraint(greaterThanOrEqualTo: userNameLabel.trailingAnchor, constant: 8),
            switchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            switchButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0 )
        ])
    }
    
    func setConstraints() {

        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
        }
        switchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(18)
            make.width.height.equalTo(16)
        }
    }
}

extension UserCardView: Tappable {

  public func didTapView() {
      switchButton.isSelected = !switchButton.isSelected
      switchButton.sendActions(for: .touchUpInside)
  }
    @objc
    func switchButtonTapped(_ sender: UIButton) {
        switchDidChange?(switchButton.isSelected)
        let image = switchButton.isSelected ? "more_arrow_up" :  "more_arrow_down"
        switchButton.setImage(UIImage(named: image), for: .normal)
        
    }

}
