//
//  HomeView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit

class MypageView: BaseView {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout() ).then {
        
        $0.backgroundColor = .clear
    }

    override func setupUI() {
        super.setupUI()
        addSubview(collectionView)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
