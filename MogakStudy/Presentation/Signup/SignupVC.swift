//
//  SignupVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit

class SignupVC: BaseVC {
    
    let mainView = SignupView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
