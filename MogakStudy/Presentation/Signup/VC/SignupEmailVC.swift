//
//  SignupEmailVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import RxSwift
import RxCocoa
import MogakStudyUIFramework

class SignupEmailVC: BaseVC {
    
    let mainView = SignupEmailView()
    let viewModel = SignupViewModel()
    var nickname = String()
    var birthday = String()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    func bind() {
        
        let validation = mainView.emailInput
            .rx.text.orEmpty
            .map { $0.isValidString(.email)}
            .share()
        
        validation
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
                
                let viewController = SignupGenderVC()
                viewController.nickname = vc.nickname
                viewController.birthday = vc.birthday
                viewController.email = vc.mainView.emailInput.text!
                viewController.modalPresentationStyle = .fullScreen
                vc.present(viewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
