//
//  KeywordMyPreferableCVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit
import SnapKit
import Then
import MogakStudyUIFramework

final class KeywordMyPreferableCVC: UICollectionViewCell {
    let keywordLabel = UILabel().then {
        $0.font = .Title4_R14
        $0.textColor = .msColor.brandGreen
    }
    let deleteButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = UIColor.msColor.brandGreen
    }
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
    }
    let keywordBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.msColor.brandGreen.cgColor
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
        contentView.addSubviews(keywordBackgroundView, stackView)
        stackView.addArangedSubviews(keywordLabel, deleteButton)
    }
    func setConstraints() {
        deleteButton.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }
        keywordBackgroundView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(stackView)
            make.edges.equalToSuperview()
        }
    }
}
