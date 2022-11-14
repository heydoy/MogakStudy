//
//  OnboardingCVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit

class OnboardingCVC: UICollectionViewCell {
    let mainImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then {
        $0.font = .Onboarding_R24
        $0.textAlignment = .center
        $0.textColor = .msColor.black
        $0.numberOfLines = 0
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ message: OnboardingModel) {
        mainImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        let attributes: NSMutableAttributedString = generateLabelAttribute(
            titleLabel,
            texts: message.attributedTitle,
            fonts: .Onboarding_M24,
            colors: .msColor.brandGreen)
        
        titleLabel.attributedText = attributes
    }
    
    // MARK: - UI
    private func configure() {
        contentView.addSubviews(mainImageView, titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.leading.trailing.equalToSuperview()
            make.height.equalTo(mainImageView.snp.width)
        }
        
        
    }
    
    private func setUI() {
        backgroundColor = .clear
    }
}
