//
//  SplashVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/14.
//

import UIKit
import SnapKit
import Then
import Toast

class ConciergeVC: UIViewController {
    // MARK: - Properties
    let networkReachableManager = NetworkReachableManager.shared
    
    let splashImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "splash_logo")
    }
    let splashText = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "splash_txt")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkNetworkAvailability()
    }
    
    // MARK: - Helpers
    func configure() {
        //view.addSubviews(splashImage, splashText)
        view.addSubviews(splashImage, splashText)
        view.backgroundColor = .white
    }
    func setConstraints() {
        splashImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.586)
            make.height.equalTo(splashImage.snp.width).multipliedBy(1.2)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        splashText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(splashText.snp.width).multipliedBy(0.34)
            make.top.equalTo(splashImage.snp.bottom).offset(28)
        }
    }
    
    // MARK: - Actions
    func checkNetworkAvailability() {
        if networkReachableManager.reachability.connection == .unavailable {
           view.makeToast("네트워크 연결을 다시 확인해주세요", duration: 1.8, position: .center)
        } else {
            if let idtoken = LoginManager.shared.idToken {
                // 로그인
                print("idtoken", idtoken)
                let vc = verifySMSVC()
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            } else {
                // 온보딩
                let vc = OnboardingVC()
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true)
            }
        }
    }
}
