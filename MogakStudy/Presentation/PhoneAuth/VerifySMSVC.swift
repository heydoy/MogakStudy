//
//  VerifySMSVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation
import RxSwift
import RxCocoa
import MogakStudyUIFramework
import Alamofire

class verifySMSVC: BaseVC {
    
    let mainView = VerifySMSView()
    var viewModel = AuthViewModel()
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind () {
        let codeValidation = mainView.codeInput
            .rx.text.orEmpty
            .map { $0.isValidString(.code)}
            .share()
        
        codeValidation
            .withUnretained(self)
            .bind { (vc, bool) in
                let color: ButtonStatusColor = bool ? FillButton() : DisableButton()
                vc.mainView.verifyCodeButton.backgroundColor = color.backgroundColor
                vc.mainView.verifyCodeButton.titleLabel?.textColor = color.titleColor
                vc.mainView.verifyCodeButton.layer.borderColor = color.borderColor
            }
            .disposed(by: disposeBag)
        
        codeValidation
            .withUnretained(self)
            .bind { (vc, bool) in
                if bool {
                    vc.viewModel.phoneVerify(code: vc.mainView.codeInput.text!)
                    vc.viewModel.getToken { bool in
                        if bool {
                            AF.request(Router.userLogin).response { data in
                                print(data)
                                print(data.response?.statusCode)
                            }
                        }
                    }
                }
            }
        
        
    }
    
}
