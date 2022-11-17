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
    var phoneNumber = String()
    let limitTime = 20 // 20초 시간제한
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimer()
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
                                print(LoginManager.shared.idToken)
                                print(data)
                                print(data.response?.statusCode)
                                let viewController = SignupNicknameVC()
                                viewController.modalPresentationStyle = .fullScreen
                                vc.present(viewController, animated: true)
                            }
                        }
                    }
                }
            }
            .disposed(by: disposeBag)
        
        mainView.resendButton
            .rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.mainView.timerLabel.isHidden = false
                vc.mainView.timerLabel.text = "00:\(vc.limitTime)"
                vc.setTimer()
                vc.mainView.resendButton.isEnabled = false
                let buttonColor = InactiveButton()
                vc.mainView.resendButton.backgroundColor = buttonColor.backgroundColor
                vc.mainView.resendButton.setTitleColor(buttonColor.titleColor, for: .normal)
                vc.mainView.resendButton.layer.borderColor = buttonColor.borderColor
//                vc.viewModel.sendSMS(phoneNumber: vc.phoneNumber)  { bool in
//                    if bool {
//                        // 문자가 잘 갔다면 여기에 넣기
//                    }
//                }
            }
            .disposed(by: disposeBag)
    }
    
}

extension verifySMSVC {
    func setTimer() {
        let startTime = Date()
        
        let timer = Observable<Int>
            .interval(
                .seconds(1), scheduler: MainScheduler.instance)
            .withUnretained(self)
            .subscribe { (vc, countValue) in
                let elapseSeconds = Date().timeIntervalSince(startTime)
                let remainedTime = vc.limitTime - Int(elapseSeconds)
                let remainedTimeString = remainedTime >= 10 ? "\(remainedTime)" : "0\(remainedTime)"
                vc.mainView.timerLabel.text = "00:\(remainedTimeString)"
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) { [weak self] in
            timer.dispose()
            self?.mainView.resendButton.isEnabled = true
            let buttonColor = FillButton()
            self?.mainView.resendButton.backgroundColor = buttonColor.backgroundColor
            self?.mainView.resendButton.setTitleColor(buttonColor.titleColor, for: .normal)
            self?.mainView.resendButton.layer.borderColor = buttonColor.borderColor
            self?.mainView.timerLabel.isHidden = true
        }
    }

}
