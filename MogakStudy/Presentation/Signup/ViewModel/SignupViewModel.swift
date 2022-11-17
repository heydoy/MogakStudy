//
//  SignupViewModel.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class SignupViewModel: ViewModelType {
    
    let signupResponse = PublishSubject<Bool>()
    
    func postSignup(phoneNumber: String, nick: String, birth: String, email: String, gender: Int) {
        
        guard let fcmToken = LoginManager.shared.FCMtoken else { return }
        AF.request(Router.userSignup(phoneNumber: phoneNumber, FCMtoken: fcmToken, nick: nick, birth: birth, email: email, gender: gender)).response { [weak self] response in
            print("회원가입 상태코드", response.response?.statusCode)
            switch response.result {
            case .success(let success):
                self?.signupResponse.onNext(true)
                
            case .failure(let failure):
                self?.signupResponse.onError(failure)
                
            }
        }
    }
    
    struct Input {
        let nicknameText: ControlProperty<String?>
        let birthdayDate: ControlProperty<Date>
        let emailText: ControlProperty<String?>
        let genderText: ControlProperty<Int?>
        let nextTap: ControlEvent<Void>
    }
    struct Output {
        let nicknameValidation: Observable<Bool>
        let birthdayValidation:
        Observable<Bool>
        let changeBirthdayISO8601: Observable<String>
        let emailValidation:
        Observable<Bool>
        let nextTap: ControlEvent<Void>
    }
    func transform(input: Input) -> Output {
        let nicknameValidation = input.nicknameText
            .orEmpty
            .map { $0.isValidString(.nickname)}
            .share()
        let birthdayValidation = input.birthdayDate
            .map { $0.checkAgeLimit() }
            .share()
        let changeBirthdayISO8601 = input.birthdayDate
            .map { $0.changeToValidBirthday() }
        let emailValidation = input.emailText
            .orEmpty
            .map { $0.isValidString(.email)}
        
        
        return Output(nicknameValidation: nicknameValidation,
                      birthdayValidation: birthdayValidation,
                      changeBirthdayISO8601: changeBirthdayISO8601,
                      emailValidation: emailValidation,
                      nextTap: input.nextTap)
    }
}
