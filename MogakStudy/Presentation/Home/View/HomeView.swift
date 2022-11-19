//
//  HomeView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/17.
//

import UIKit
import MapKit
import MogakStudyUIFramework

final class HomeView: BaseView {
    
    let mapView = MKMapView().then {
        $0.isPitchEnabled = true
        $0.isZoomEnabled = true
        $0.isRotateEnabled = true
    }
    let genderButtonStackView = UIStackView().then {
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        
        // 스택뷰 설정
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fillEqually
    }
    
    let genderWholeButton = UIButton().then {
        $0.titleLabel?.font = .Title3_M14
        $0.setTitleColor(.msColor.white, for: .normal)
        $0.setTitle(I18NStrings.Home.whole, for: .normal)
        $0.backgroundColor = .msColor.brandGreen
        
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 윗쪽만 둥글리기
    }
    let genderMaleButton = UIButton().then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitleColor(.msColor.black, for: .normal)
        $0.setTitle(I18NStrings.Signup.male, for: .normal)
        $0.backgroundColor = .msColor.white
    }
    let genderFemaleButton = UIButton().then {
        $0.titleLabel?.font = .Title4_R14
        $0.setTitleColor(.msColor.black, for: .normal)
        $0.setTitle(I18NStrings.Signup.female, for: .normal)
        $0.backgroundColor = .msColor.white
        
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // 아래만
    }
    
    let gpsButton = UIButton().then {
        $0.setImage(UIImage(named: "place"), for: .normal)
        $0.clipsToBounds = true
        $0.backgroundColor = .msColor.white
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    }
    let mainStatusSearchButton = UIButton().then {
        $0.setImage(UIImage(named: "search"), for: .normal)
        $0.clipsToBounds = true
        $0.backgroundColor = .msColor.black
        $0.layer.cornerRadius = 32
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        $0.isHidden = false
    }
    let mainStatusAntennaButton = UIButton().then {
        $0.setImage(UIImage(named: "antenna"), for: .normal)
        $0.clipsToBounds = true
        $0.backgroundColor = .msColor.black
        $0.layer.cornerRadius = 32
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        $0.isHidden = true
    }
    let mainStatusMessageButton = UIButton().then {
        $0.setImage(UIImage(named: "message"), for: .normal)
        $0.clipsToBounds = true
        $0.backgroundColor = .msColor.black
        $0.layer.cornerRadius = 32
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 3.0
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        $0.isHidden = true
    }
    
    override func setupUI() {
        addSubviews(mapView, genderButtonStackView, gpsButton,mainStatusSearchButton, mainStatusAntennaButton, mainStatusMessageButton)
        genderButtonStackView.addArangedSubviews(genderWholeButton, genderMaleButton, genderFemaleButton)
    }
    
    override func setConstraints() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        genderButtonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(safeAreaLayoutGuide).inset(8)
            make.width.equalTo(48)
            make.height.equalTo(144)
        }
        gpsButton.snp.makeConstraints { make in
            make.leading.equalTo(genderButtonStackView)
            make.top.equalTo(genderButtonStackView.snp.bottom).offset(16)
            make.width.height.equalTo(48)
        }
        mainStatusSearchButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(64)
        }
        mainStatusAntennaButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(64)
        }
        mainStatusMessageButton.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(64)
        }
    }
}
