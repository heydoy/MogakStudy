//
//  SignupGenderVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import RxSwift
import RxCocoa
import MogakStudyUIFramework
import Toast
import Alamofire

class SignupGenderVC: BaseVC {
    
    let mainView = SignupGenderView()
    let viewModel = SignupViewModel()
    var nickname = String()
    var birthday = String()
    var email = String()
    let disposeBag = DisposeBag()
    
    var maleSelected = false
    var femaleSelected = false
    
    var gender = Int()
    
    var selected: Observable<Bool> {
        get {
            return  Observable.just(maleSelected || femaleSelected)
        }
    }
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    func bind() {
       mainView.maleButton
            .rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.maleSelected = !vc.maleSelected
                if vc.maleSelected {
                    vc.femaleSelected = false
                    vc.gender = 0
                    vc.mainView.maleButton.backgroundColor = .msColor.brandWhiteGreen
                } else {
                    vc.mainView.maleButton.backgroundColor = .msColor.white
                }
            }
            .disposed(by: disposeBag)
        
        mainView.femaleButton
            .rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.femaleSelected = !vc.femaleSelected
                if vc.femaleSelected {
                    vc.maleSelected = false
                    vc.gender = 1
                    vc.mainView.femaleButton.backgroundColor = .msColor.brandWhiteGreen
                } else {
                    vc.mainView.femaleButton.backgroundColor = .msColor.white
                }
            }
            .disposed(by: disposeBag)
        
        
        selected
            .withUnretained(self)
            .bind { (vc, bool) in
                let color: ButtonStatusColor = bool ? FillButton() : DisableButton()
                vc.mainView.nextButton.backgroundColor = color.backgroundColor
                vc.mainView.nextButton.titleLabel?.textColor = color.titleColor
                vc.mainView.nextButton.layer.borderColor = color.borderColor
            }
            .disposed(by: disposeBag)
        
        
        mainView.nextButton
            .rx.tap
            .withUnretained(self)
            .subscribe { (vc, _) in
//                FBAuthManager.shared.getIdToken { string, error in
//                    print(string, error)
//                }
//
//                AF.request(Router.userSignup(phoneNumber: "+821012345677",
//                                     FCMtoken: LoginManager.shared.FCMtoken!,
//                                     nick: "hey",
//                                     birth: "1990-01-12T09:23:44.054Z",
//                                     email: "test@test.com",
//                                             gender: 1)).response { data in
//
//                    print(data.response?.statusCode)
//                    print(data.result)
//                }

                let url = "http://api.sesac.co.kr:1207/v1/user"
                        let param: Parameters = [
                            "phoneNumber": "+821012345677",
                            "FCMtoken": LoginManager.shared.FCMtoken!,
                            "nick": "hey",
                            "birth": "1990-01-12T09:23:44.054Z",
                            "email": "test@test.com",
                            "gender": 1
                        ]
                let headers: HTTPHeaders = [
                    "Content-Type": "application/x-www-form-urlencoded",
                    "idtoken" : LoginManager.shared.idToken!
                ]

                AF.request(url,method: .post,parameters: param, headers: headers).validate().responseData { response in
                    print(response.response?.statusCode)
                            switch response.result {
                            case .success(let result):
                                print(result)
                            case .failure(let error):
                                print(error)
                            }
                }
                
                vc.viewModel.postSignup(phoneNumber: "+821037044790", nick: vc.nickname, birth: vc.birthday, email: vc.email, gender: vc.gender)
                
            }
            .disposed(by: disposeBag)
        


    }
}
