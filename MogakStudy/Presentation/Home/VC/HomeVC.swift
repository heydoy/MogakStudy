//
//  HomeVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit

class HomeVC: BaseVC {
    
    let mainView = HomeView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configure() {
        mainView.mainStatusSearchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        mainView.mainStatusAntennaButton.addTarget(self, action: #selector(antennaButtonTapped), for: .touchUpInside)
        mainView.mainStatusMessageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchButtonTapped(_ sender: UIButton) {
        let vc = SearchVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    @objc func antennaButtonTapped(_ sender: UIButton) {
        let vc = FindSesacVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)

    }
    @objc func messageButtonTapped(_ sender: UIButton) {
        
    }
    

}
