//
//  UserImageView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import SnapKit
import Then 

class UserImageView: UIView {
    let backgroundImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.image = UIImage(named: "sesac_bg_01")
    }
    let faceImageView = UIImageView().then {
        $0.image = UIImage(named: "sesac_face_2")
    }
    let cardMatchButton = UIButton().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .Title3_M14
        $0.setTitle("요청하기", for: .normal)
        $0.setTitleColor(.msColor.white, for: .normal)
        $0.backgroundColor = .msColor.systemError
        $0.isHidden = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(bg: String?, face: String?, buttonEnabled: Bool?) {
        guard let bg = bg, let face = face, let buttonEnabled = buttonEnabled else {
            return
        }
        backgroundImageView.image = UIImage(named: bg)
        faceImageView.image = UIImage(named: face)
        cardMatchButton.isHidden = buttonEnabled
    }
    func configure() {
        addSubviews(backgroundImageView)
        backgroundImageView.addSubviews(faceImageView, cardMatchButton)
    }
    
    func setConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        faceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.centerX.equalToSuperview().multipliedBy(0.92)
            make.centerY.equalToSuperview().multipliedBy(1.11)
            make.width.height.equalTo(184)
        }
        cardMatchButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(12)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
}
