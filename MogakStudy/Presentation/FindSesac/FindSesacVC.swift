//
//  FindSesacVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit

class FindSesacVC: BaseVC {
        
    let mainView = FindSesacView()
    var activatedTab = EmptySesacTab.emptySesac
    
    let requestDummy: [String] = ["^^"]
    let sesacDummy: [String] = []
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func setNavigationBar() {
        super.setNavigationBar()
        navigationItem.title = "새싹찾기"
        let stopSearch = UIBarButtonItem(title: "찾기중단", style: .plain, target: self, action: #selector(stopSearchButtonTapped))
        stopSearch.setTitleTextAttributes([ .foregroundColor: UIColor.msColor.black,
                                            .font: UIFont.Title3_M14 ],
                                          for: .normal)
        navigationItem.rightBarButtonItem = stopSearch
    }
    
    override func configure() {
        mainView.tabNearSesacButton.addTarget(self, action: #selector(tabNearSesacTapped), for: .touchUpInside)
        mainView.tabReceivedRequestButton.addTarget(self, action: #selector(tabReceivedRequestTapped), for: .touchUpInside)
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.collectionView.register(EmptySesacCVC.self, forCellWithReuseIdentifier: String(describing: EmptySesacCVC.self))
        mainView.collectionView.register(SesacInfoCVC.self, forCellWithReuseIdentifier: String(describing: SesacInfoCVC.self))
    }
    
    @objc func stopSearchButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func tabNearSesacTapped(_ sender: UIButton) {
        mainView.setTabChange(for: .nearSesac)
        activatedTab = .emptySesac
        mainView.collectionView.reloadData()
    }
    @objc func tabReceivedRequestTapped(_ sender: UIButton) {
        mainView.setTabChange(for: .receivedRequest)
        activatedTab = .emptyRequest
        mainView.collectionView.reloadData()
    }

}

extension FindSesacVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let request = requestDummy.count == 0 ? 1 : requestDummy.count
        let sesac = sesacDummy.count == 0 ? 1 : sesacDummy.count
        
        return activatedTab == .emptyRequest ? request : sesac
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch activatedTab {
        case .emptyRequest :
            print("request")
            if requestDummy.isEmpty {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EmptySesacCVC.self), for: indexPath) as? EmptySesacCVC else { return UICollectionViewCell() }
                cell.setLabel(status: activatedTab)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SesacInfoCVC.self), for: indexPath) as? SesacInfoCVC else { return UICollectionViewCell() }
                
                return cell
            }
        case .emptySesac :
            print("Sesac")
            if sesacDummy.isEmpty {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EmptySesacCVC.self), for: indexPath) as? EmptySesacCVC else { return UICollectionViewCell() }
                cell.setLabel(status: activatedTab)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SesacInfoCVC.self), for: indexPath) as? SesacInfoCVC else { return UICollectionViewCell() }
                cell.cellCollectionView.collectionViewLayout = setLayout()
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.collectionView {
            if sesacDummy.isEmpty {
                let width = collectionView.bounds.size.width - 32
                let height = collectionView.bounds.size.height
                return CGSize(width: width, height: height)
            } else if requestDummy.isEmpty {
                let width = collectionView.bounds.size.width - 32
                let height = collectionView.bounds.size.height
                return CGSize(width: width, height: height)
            } else {
                let width = collectionView.bounds.size.width - 32
                let height: CGFloat = 600
                
                return CGSize(width: width, height: height)
            }
        } else { // cellCollectionView일 때
            return CGSize(width: 100, height: 100)
        }
        
    }
}
// collection view in  cell
extension FindSesacVC {
    func setLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize (
            widthDimension: .estimated(100),
            heightDimension: .estimated(32)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        
        let headerItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(20))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        
        section.boundarySupplementaryItems = [headerItem]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 8
        layout.configuration = config
        
        return layout
    }
}
