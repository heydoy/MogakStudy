//
//  HomeVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit
import MogakStudyUIFramework

enum MyPageTitle: String, CaseIterable {
    case username = "사용자 이름"
    case noti = "공지사항"
    case ask = "1:1 문의"
    case alert = "알림 설정"
    case terms = "이용약관"
    
    var image: String {
        get {
            switch self {
            case .username: return "imageName"
            case .noti: return "imageName"
            case .ask: return "imageName"
            case .alert: return "imageName"
            case .terms: return "imageName"
            }
        }
    }
}


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
    
    override func setNavigationBar() {
        navigationItem.title = I18NStrings.TabBar.mypageTab
    }
    
    override func configure() {
        //mainView.collectionView.delegate = self
        mainView.collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }
}
// 컴포지셔널 레이아웃
extension MypageVC {
    func  createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        
        return layout
    }
    func configureDataSource() {
        // Cell Registration
        let cellRegistration =  UICollectionView.CellRegistration<UICollectionViewListCell, Item>(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.textProperties.font = .Title2_R16
            content.textProperties.color = .msColor.black
            content.text = itemIdentifier.rawValue
            
            content.image = UIImage(systemName: "person")
            //content.image = UIImage(named: itemIdentifier.image)
                        
            cell.contentConfiguration = content
            
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
