//
//  HomeVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit
import MogakStudyUIFramework

typealias Item = MyPageTitle
typealias Section = Int

class MypageVC: BaseVC {
    
    let mainView = MypageView()
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func setNavigationBar() {
        navigationItem.title = I18NStrings.TabBar.mypageTab
    }
    
    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }
}
// 컴포지셔널 레이아웃
extension MypageVC {
    func  createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        //let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        return layout
    }
    func configureDataSource() {
        // Cell Registration
        let cellRegistration =  UICollectionView.CellRegistration<UICollectionViewListCell, Item>(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.textProperties.font = .Title2_R16
            content.textProperties.color = .msColor.black
            content.text = itemIdentifier.title
            content.image = UIImage(named: itemIdentifier.image)
            
            if itemIdentifier == Item.username {
            cell.accessories = [.disclosureIndicator(options: .init( reservedLayoutWidth: .custom(48), tintColor: .msColor.gray007))]
            }
            cell.contentConfiguration = content
            cell.indentationWidth = 17
            cell.separatorLayoutGuide.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 17).isActive = true
            
            var background = UIBackgroundConfiguration.listPlainCell()
            background.backgroundColor = .clear
            cell.backgroundConfiguration = background
            
        })
        
        // Diffable Data Source
        // collectionView.dataSource = self 코드의 대체
        // CellForItemAt 대체
        dataSource = UICollectionViewDiffableDataSource(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration , for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
        // 스냅샷, 모델을 Initialise 해줄 것
        // 스냅샷 타입은 위에 dataSource형태와 맞추기 (섹션, 모델타입)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([0])
        snapshot.appendItems(Item.allCases, toSection: 0)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
extension MypageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == Item.username.rawValue {
            // 정보관리로 이동
            let vc = InfoManageVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

