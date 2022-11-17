//
//  PhoneAuthVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit
import RxSwift
import RxCocoa
import MogakStudyUIFramework

class PhoneAuthVC: BaseVC {
    
    let mainView = PhoneAuthView()
    let viewModel = AuthViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func configure() {
    }
    
    func bind() {
        let input = AuthViewModel.Input(
            phoneNumberText: mainView.phoneInput.rx.text,
            getCodeButtonTap: mainView.getCodeButton.rx.tap)
        
        let output = viewModel.transform(input: input)
        
        mainView.phoneInput
            .rx.text
            .orEmpty
            .map { $0.applyPatternOnNumbers(pattern: "###-####-####", replacmentCharacter: "#")}
            .bind(to: mainView.phoneInput.rx.text)
            .disposed(by: disposeBag)
        
        output.phoneNumberValidation
            .withUnretained(self)
            .bind { (vc, bool) in
                let color: ButtonStatusColor = bool ? FillButton() : DisableButton()
                vc.mainView.getCodeButton.backgroundColor = color.backgroundColor
                vc.mainView.getCodeButton.titleLabel?.textColor = color.titleColor
                vc.mainView.getCodeButton.layer.borderColor = color.borderColor
            }
            .disposed(by: disposeBag)
        
        output.getCodeButtonTap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.viewModel.sendSMS(phoneNumber: ("+82 " + vc.mainView.phoneInput.text!))  { bool in
                    if bool {
                        let viewController = verifySMSVC()
                        viewController.modalPresentationStyle = .fullScreen
                        vc.present(viewController, animated: true)
                        viewController.viewModel = vc.viewModel
                    }
                }
            }
            .disposed(by: disposeBag)
    }
}
