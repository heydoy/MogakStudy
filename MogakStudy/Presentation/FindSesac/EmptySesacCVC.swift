//
//  EmptySesacCVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/29.
//

import UIKit
import SnapKit
import Then
import MogakStudyUIFramework

enum EmptySesacTab {
    case emptySesac
    case emptyRequest
    
    var titleText: String {
        get {
            switch self {
            case .emptySesac: return "아쉽게도 주변에 새싹이 없어요ㅠ"
            case .emptyRequest: return "아직 받은 요청이 없어요ㅠ"
            }
        }
    }
}

final class EmptySesacCVC: UICollectionViewCell {
    lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "empty_sesac")
    }
    let titleLabel = UILabel().then {
        $0.font = .Display1_R20
        $0.textColor = .msColor.black
    }
    let descriptionLabel = UILabel().then {
        $0.font = .Title4_R14
        $0.textColor = .msColor.gray007
        $0.text = "스터디를 변경하거나 조금만 더 기다려 주세요!"
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
        contentView.addSubviews(imageView, titleLabel, descriptionLabel)
    }
    func setLabel(status: EmptySesacTab) {
        titleLabel.text = status.titleText
    }
    func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.width.height.equalTo(64)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(32)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
}
