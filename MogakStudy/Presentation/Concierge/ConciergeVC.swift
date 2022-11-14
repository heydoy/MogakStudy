//
//  SplashVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/14.
//

import UIKit
import SnapKit
import Then

class ConciergeVC: UIViewController {
    // MARK: - Properties
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
        print(#function)
        configure()
        setConstraints()
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
}
