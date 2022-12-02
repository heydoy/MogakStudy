//
//  KeywordHeaderCRV.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

final class KeywordHeaderCRV: UICollectionReusableView {
    
    let titleLabel = UILabel().then {
        $0.font = .Title6_R12
        $0.textColor = .msColor.black
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
       addSubview(titleLabel)
    }
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
    }
    
}
