//
//  KeywordAroundMeCVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit
import MogakStudyUIFramework
import SnapKit
import Then

enum KeywordType {
    case serviceRecommended
    case fromAround
}


final class KeywordRecommendedCVC: UICollectionViewCell {
    
    let keywordLabel = UILabel().then {
        $0.font = .Title4_R14
    }
    let keywordBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
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
        contentView.addSubviews(keywordLabel, keywordBackgroundView)
    }
    
    func designUI(state: KeywordType) {
        var borderColor: CGColor
        var titleColor: UIColor
        
        switch state {
        case .serviceRecommended:
            titleColor = .msColor.systemError
            borderColor = UIColor.msColor.systemError.cgColor
        case .fromAround:
            titleColor = .msColor.black
            borderColor = UIColor.msColor.gray004.cgColor
        }
        keywordLabel.textColor = titleColor
        keywordBackgroundView.layer.borderColor = borderColor
    }
    
    func setConstraints() {
        keywordLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(5)
        }
        keywordBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(keywordLabel)
            make.top.equalTo(keywordLabel).offset(-5)
            make.leading.equalTo(keywordLabel).offset(-16)
            make.bottom.equalTo(keywordLabel).offset(5)
            make.trailing.equalTo(keywordLabel).offset(16)
        }
    }
}
