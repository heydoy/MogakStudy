//
//  SignupVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import UIKit
import RxSwift
import RxCocoa
import Hero
import MogakStudyUIFramework

class SignupNicknameVC: BaseVC {
    
    let mainView = SignupNicknameView()
    let viewModel = SignupViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind() {
        //let input = SignupViewModel.Input()
        
        let validation = mainView.nicknameInput
            .rx.text.orEmpty
            .map { $0.isValidString(.nickname)}
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
                
                let viewController = SignupBirthdayVC()
                viewController.nickname = vc.mainView.nicknameInput.text!
                viewController.modalPresentationStyle = .fullScreen
                vc.present(viewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
