//
//  SignupBirthdayVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import RxSwift
import RxCocoa
import MogakStudyUIFramework
import Toast

class SignupBirthdayVC: BaseVC {
    
    let mainView = SignupBirthdayView()
    var nickname = String()
    var viewModel = SignupViewModel()
    let disposeBag = DisposeBag()
    
    var birthday: Date!
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind() {
        mainView.datePicker
            .rx.date
            .withUnretained(self)
            .bind { (vc, date) in
                let ymd = date.dateToSeperateYMD()
                vc.mainView.birthYInput.text = ymd[0]
                vc.mainView.birthMInput.text = ymd[1]
                vc.mainView.birthDInput.text = ymd[2]
                
                vc.birthday = date
            }
        
        mainView.nextButton
            .rx.tap
            .withUnretained(self)
            .subscribe { (vc, _) in
                
                if vc.birthday.checkAgeLimit() {
                    let viewController = SignupEmailVC()
                    viewController.birthday = vc.birthday.changeToValidBirthday()
                    viewController.nickname = vc.nickname
                    viewController.modalPresentationStyle = .fullScreen
                    vc.present(viewController, animated: true)
                } else {
                    vc.mainView.makeToast("17세 이상만 가입할 수 있습니다.")
                }
                
            }
            .disposed(by: disposeBag)
    }
    
}
