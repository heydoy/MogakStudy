//
//  FindSesacView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit
import SnapKit
import Then
import MogakStudyUIFramework

enum FindSesacTab {
    case nearSesac
    case receivedRequest
}

final class FindSesacView: BaseView {
    
    let changeStudyButton = msButton(status: FillButton()).then {
        $0.setTitle("스터디 변경하기", for: .normal)
        $0.titleLabel?.font = .Body3_R14
    }
    
    let refreshButton = msButton(status: OutlineButton()).then {
        $0.setImage(UIImage(named: "refresh"), for: .normal)
    }
    
    let tabNearSesacButton = UIButton().then {
        $0.setTitle("주변 새싹", for: .normal)
        $0.titleLabel?.font = .Title3_M14
        $0.setTitleColor(.msColor.brandGreen, for: .normal)
    }
    let tabReceivedRequestButton = UIButton().then {
        $0.setTitle("받은 요청", for: .normal)
        $0.titleLabel?.font = .Title4_R14
        $0.setTitleColor(.msColor.gray006, for: .normal)
    }
    let grayBar = UIView().then {
        $0.backgroundColor = .msColor.gray002
    }
    let pointBar = UIView().then {
        $0.backgroundColor = .msColor.brandGreen
    }
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 0, height: 0)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 16, right: 16)
        
        $0.collectionViewLayout = layout
        $0.bounces = true
        $0.backgroundColor = .clear
        
    }
    
    override func setupUI() {
        super.setupUI()
        
        addSubviews(refreshButton, changeStudyButton, tabNearSesacButton, tabReceivedRequestButton, grayBar, pointBar, collectionView)
    }
    
    override func setConstraints() {
        refreshButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(48)
        }
        changeStudyButton.snp.makeConstraints { make in
            make.trailing.equalTo(refreshButton.snp.leading).offset(-8)
            make.leading.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        tabNearSesacButton.snp.makeConstraints { make in
            make.leading.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        tabReceivedRequestButton.snp.makeConstraints { make in
            make.trailing.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(tabNearSesacButton.snp.trailing)
            make.height.equalTo(44)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        grayBar.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(tabNearSesacButton)
        }
        pointBar.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.leading.bottom.equalTo(tabNearSesacButton)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(grayBar.snp.bottom)
            make.bottom.equalTo(changeStudyButton.snp.top).offset(-16)
        }
    }
    
    func setTabChange(for tab: FindSesacTab) {
        switch tab {
        case .nearSesac:
            tabNearSesacButton.titleLabel?.font = .Title3_M14
            tabNearSesacButton.setTitleColor(.msColor.brandGreen, for: .normal)
            tabReceivedRequestButton.titleLabel?.font = .Title4_R14
            tabReceivedRequestButton.setTitleColor(.msColor.gray006, for: .normal)
            pointBar.snp.remakeConstraints { make in
                make.height.equalTo(2)
                make.width.equalToSuperview().multipliedBy(0.5)
                make.leading.bottom.equalTo(tabNearSesacButton)
            }
            super.updateConstraints()
        case .receivedRequest:
            tabNearSesacButton.titleLabel?.font = .Title4_R14
            tabNearSesacButton.setTitleColor(.msColor.gray006, for: .normal)
            tabReceivedRequestButton.titleLabel?.font = .Title3_M14
            tabReceivedRequestButton.setTitleColor(.msColor.brandGreen, for: .normal)
            pointBar.snp.remakeConstraints { make in
                make.height.equalTo(2)
                make.width.equalToSuperview().multipliedBy(0.5)
                make.trailing.bottom.equalTo(tabReceivedRequestButton)
            }
        }
    }
}
