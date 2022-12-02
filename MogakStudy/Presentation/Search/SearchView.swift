//
//  SearchView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit
import SnapKit
import Then
import MogakStudyUIFramework

final class SearchView: BaseView {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        $0.backgroundColor = .clear
        $0.keyboardDismissMode = .onDrag
    }
    
    let searchButton = msButton(status: FillButton()).then {
        $0.setTitle("새싹 찾기", for: .normal)
        $0.titleLabel?.font = .Body3_R14
    }
    
    override func setupUI() {
        super.setupUI()
        
        addSubviews(collectionView, searchButton)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
        searchButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
    }
    
    @objc func setButtonLocationWhenKeybobardAppeared(notification: NSNotification) {
        
    }

}

