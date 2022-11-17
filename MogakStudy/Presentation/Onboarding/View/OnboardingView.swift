//
//  OnboardingView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/14.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework

final class OnboardingView: BaseView {
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.backgroundColor = .clear
    }
    let pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .msColor.black
        $0.pageIndicatorTintColor = .msColor.gray005
        $0.currentPage = 0
    }
    let startButton = msButton(status: FillButton()).then {
        $0.setTitle(I18NStrings.Onboarding.startButtonTitle, for: .normal)
        $0.titleLabel?.font = .Body3_R14
    }
    
    override func setupUI() {
        super.setupUI()
        addSubviews(startButton, pageControl, collectionView)
    }
    
    
    override func setConstraints() {
        startButton.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-24)
            make.centerX.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(pageControl.snp.top).offset(-24)
            make.leading.trailing.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().inset(24)
            make.height.equalToSuperview().multipliedBy(0.65)
        }
    }
    
}
