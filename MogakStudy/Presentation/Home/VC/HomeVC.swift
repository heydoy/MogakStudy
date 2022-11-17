//
//  HomeVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit

class HomeVC: UIViewController {
    
    let mainView = HomeView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
