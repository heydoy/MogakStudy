//
//  InfoManageVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/20.
//

import UIKit
import SwiftUI

final class InfoManageVC: BaseVC {

    let mainView = InfoManageView()
    
    override func loadView() {
        view =  mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func setNavigationBar() {
        super.setNavigationBar()
        navigationItem.title = I18NStrings.MyInfo.infoManagement
        
        let save = UIBarButtonItem(title: I18NStrings.MyInfo.save,
                                   style: .plain,
                                   target: self,
                                   action: #selector(saveButtonTapped(_:)) )
        navigationItem.rightBarButtonItem = save
    }
    override func configure() {
        
    }
    
    // MARK: - Actions
    @objc 
    func saveButtonTapped(_ sender: UIBarButtonItem) {
        // 내용 저장하기
    }
    

}

struct VCPreView:PreviewProvider {
    static var previews: some View {
        TabBarVC().toPreview()
    }
}
