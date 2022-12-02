//
//  SearchVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/28.
//

import UIKit

enum KeywordSection: Int, CaseIterable {
    case aroundMe = 0
    case myPreferable
    
    var title: String {
        get {
            switch self {
            case .aroundMe: return "지금 주변에는"
            case .myPreferable: return "내가 하고 싶은"
            }
        }
    }
}

class SearchVC: BaseVC {
    
    var dummy = [ "iOS", "Swift", "dummy", "iOS", "Swift", "dummy", "iOS", "Swift", "dummy", "iOS", "Swift", "dummy"] {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        mainView.searchButton.layer.cornerRadius = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height - mainView.safeAreaInsets.bottom
            mainView.searchButton.snp.remakeConstraints { make in
                make.leading.trailing.equalTo(mainView.safeAreaLayoutGuide)
                make.bottom.equalTo(mainView.safeAreaLayoutGuide).offset(-1 * keyboardHeight)
                make.height.equalTo(48)
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        mainView.searchButton.layer.cornerRadius = 8
        mainView.searchButton.snp.remakeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.bottom.equalTo(mainView.safeAreaLayoutGuide).inset(16)
        }
    }
    override func setNavigationBar() {
        super.setNavigationBar()
        let width = UIScreen.main.bounds.width
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: width - 70, height: 0))
        searchBar.placeholder = "띄어쓰기로 복수 입력이 가능해요"
        searchBar.searchTextField.font = .Title4_R14
        searchBar.searchTextField.textColor = .msColor.black
        
        if #available(iOS 16.0, *) {
            navigationItem.titleView = searchBar
            navigationItem.preferredSearchBarPlacement = .inline
        } else {
            // Fallback on earlier versions
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)
        }
        
        searchBar.delegate = self
    }
    
    override func configure() {
        mainView.collectionView.collectionViewLayout = setLayout()
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainView.collectionView.register(KeywordRecommendedCVC.self, forCellWithReuseIdentifier: String(describing: KeywordRecommendedCVC.self))
        mainView.collectionView.register(KeywordMyPreferableCVC.self, forCellWithReuseIdentifier: String(describing: KeywordMyPreferableCVC.self))
        mainView.collectionView.register(KeywordHeaderCRV.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: String(describing: KeywordHeaderCRV.self))
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchButtonTapped( _ sender: UIButton) {
        let vc = FindSesacVC()
        self.navigationController?.viewControllers = [vc]
    }

}

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return KeywordSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == KeywordSection.aroundMe.rawValue {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: KeywordRecommendedCVC.self), for: indexPath) as? KeywordRecommendedCVC else { return UICollectionViewCell() }
            cell.keywordLabel.text = dummy[indexPath.item]
            let state: KeywordType = indexPath.item < 3 ? .serviceRecommended : .fromAround
            cell.designUI(state: state)
            return cell
        } else if indexPath.section == KeywordSection.myPreferable.rawValue  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: KeywordMyPreferableCVC.self), for: indexPath) as? KeywordMyPreferableCVC else { return UICollectionViewCell() }
            cell.keywordLabel.text = dummy[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: KeywordHeaderCRV.self), for: indexPath) as? KeywordHeaderCRV else { return UICollectionReusableView() }
        
        switch indexPath.section {
        case KeywordSection.aroundMe.rawValue:
            header.titleLabel.text = KeywordSection.aroundMe.title
        case KeywordSection.myPreferable.rawValue:
            header.titleLabel.text = KeywordSection.myPreferable.title
        default :
            print("different section")
        }
        
        return header
    }
}
// compositional layout setting
extension SearchVC {
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
// MARK: - Searchbar delegate
extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            if !text.isEmpty {
                let keywords = text.split(separator: " ")
                print(keywords)
            }
        }
        searchBar.text = ""
    }
}
