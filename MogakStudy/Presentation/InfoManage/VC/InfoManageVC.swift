//
//  InfoManageVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/20.
//

import UIKit
import SwiftUI
import AloeStackView
import MogakStudyUIFramework

enum InfoManageTitle: Int, CaseIterable {
    case myGender = 0
    case study
    case allowSearch
    case ageSpan
    case withdraw
    
    var title: String {
        get {
            switch self {
            case .myGender: return I18NStrings.MyInfo.myGender
            case .study: return I18NStrings.MyInfo.studyAlot
            case .allowSearch: return I18NStrings.MyInfo.allowSearchMynumber
            case .ageSpan: return I18NStrings.MyInfo.ageSpan
            case .withdraw: return I18NStrings.MyInfo.withdraw
            }
        }
    }
}

final class InfoManageVC: AloeStackViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStackView()
        setUpRows()
        setNavigationBar()
    }
    
    private func setUpStackView() {
        stackView.automaticallyHidesLastSeparator = true
        stackView.hidesSeparatorsByDefault = true
        stackView.rowInset = UIEdgeInsets(top: 21, left: 16, bottom: 21, right: 16)
    
    }
    private func setUpRows() {
        setUpImageRow()
        setUpSwitchRow()
        setUpHiddenRows()
        stackView.addRow(MyGenderView())
        stackView.addRow(StudyPreferrableView())
        stackView.addRow(AllowPhoneSearhView())
        stackView.addRow(AgeSpanView())
        stackView.addRow(WithdrawView())
        
    }
    private func setUpImageRow() {
        let imageRow = UserImageView()
        stackView.addRow(imageRow)
    }
    private func setUpSwitchRow() {
        let switchRow = UserCardView()
        switchRow.userNameLabel.text = "김새싹"
        switchRow.switchDidChange = { [weak self] isSelected in
            guard let self = self else { return }
            self.stackView.setRowsHidden(self.hiddenRows, isHidden: !isSelected, animated: true)
        }
        switchRow.layer.cornerRadius = 8
        switchRow.layer.borderColor = UIColor.msColor.gray002.cgColor
        switchRow.layer.borderWidth = 1
        stackView.addRow(switchRow)
    }
    
    private let hiddenRows = [UserCardTitleView(), UserCardReviewView()]
    
    private func setUpHiddenRows() {
        
        stackView.addRows(hiddenRows)
        stackView.hideRows(hiddenRows)
        
        let rowInset = UIEdgeInsets(top: 13, left: 32, bottom: 13, right: 32)
        stackView.setInset(forRows: hiddenRows, inset: rowInset)
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .msColor.black
        
        if self != navigationController?.viewControllers.first {
            let customBackButton = UIBarButtonItem(
                image: UIImage(named: "arrow"),
                style: .plain,
                target: self,
                action: #selector(backButtonTapped) )
            
            navigationItem.leftBarButtonItem = customBackButton
        }
        navigationItem.title = I18NStrings.MyInfo.infoManagement
        
        let save = UIBarButtonItem(title: I18NStrings.MyInfo.save,
                                   style: .plain,
                                   target: self,
                                   action: #selector(saveButtonTapped(_:)) )
        navigationItem.rightBarButtonItem = save
        
        // 탭바 없애기
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Actions
    @objc
    func saveButtonTapped(_ sender: UIBarButtonItem) {
        // 내용 저장하기
    }
    @objc
    func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
// 프리뷰
struct VCPreView:PreviewProvider {
    static var previews: some View {
        TabBarVC().toPreview()
    }
}
