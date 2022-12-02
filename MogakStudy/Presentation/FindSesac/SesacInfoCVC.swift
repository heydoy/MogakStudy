//
//  SesacInfoCVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/29.
//

import UIKit
import SnapKit
import Then
import MogakStudyUIFramework


final class SesacInfoCVC: UICollectionViewCell {
    
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
        $0.isHidden = false
    }
    let cardAcceptButton = UIButton().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .Title3_M14
        $0.setTitle("수락하기", for: .normal)
        $0.setTitleColor(.msColor.white, for: .normal)
        $0.backgroundColor = .msColor.systemSuccess
        $0.isHidden = true
    }
    
    let stackView = UIStackView().then {
        $0.layer.borderColor = UIColor.msColor.gray002.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 24
    }
    let baseStackView = UIView()
    let userNameLabel = UILabel().then {
        $0.text = "김새싹"
        $0.font = .Title1_M16
        $0.textColor = .msColor.black
    }
    let switchButton = UIButton().then {
        $0.setImage(UIImage(named: "more_arrow_down"), for: .normal)
    }
    
    lazy var cellCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout() ).then {
        $0.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubviews(backgroundImageView, cardMatchButton,cardAcceptButton, stackView, cellCollectionView)
        backgroundImageView.addSubviews(faceImageView)
        stackView.addArangedSubviews(baseStackView )
        baseStackView.addSubviews(userNameLabel, switchButton)
    }
    
    func setConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(backgroundImageView.snp.width).multipliedBy(0.56)
        }
        faceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.centerX.equalToSuperview().multipliedBy(0.9)
            make.centerY.equalToSuperview().multipliedBy(1.1)
            make.width.height.equalTo(184)
        }
        cardMatchButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(12)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        cardAcceptButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(12)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(backgroundImageView.snp.bottom)
        }
        baseStackView.snp.makeConstraints { make in
            make.height.equalTo(58)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        switchButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        userNameLabel.snp.makeConstraints { make in
            make.trailing.greaterThanOrEqualTo(switchButton.snp.leading).offset(8)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
        cellCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
