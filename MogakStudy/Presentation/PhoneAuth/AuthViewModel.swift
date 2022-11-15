//
//  AuthViewModel.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/15.
//

import Foundation
import RxSwift
import RxCocoa

class AuthViewModel: ViewModelType {
    
    var verificationID = ""
    
    func sendSMS(phoneNumber: String, completion: @escaping ((Bool)->())) {
        FBAuthManager.shared.sendSMS(phoneNumber: phoneNumber) { [weak self] result in
            switch result {
            case .success(let value):
                
                self?.verificationID = value
                print(self?.verificationID)
                
                completion(true)
                
            case .failure(let error):
                print("error", error.localizedDescription)
                
                completion(false)
            }
        }
    }
    
    func phoneVerify(code: String) {
        FBAuthManager.shared.phoneVerification(verificationID: verificationID, verificationCode: code) { result, error in
            if let result = result {
                print(result, "성공인가")
            }
        }
    }
    
    func getToken(completion: @escaping (Bool) -> ()) {
        FBAuthManager.shared.getIdToken { idToken, error in
            if let idToken = idToken {
                LoginManager.shared.idToken = idToken
                print(LoginManager.shared.idToken)
                completion(true)
            }
            
            completion(false)
        }
    }

    
    //인풋-아웃풋 패턴
    
    struct Input {
        let phoneNumberText: ControlProperty<String?>
        let getCodeButtonTap: ControlEvent<Void>
    }
    struct Output {
        let phoneNumberValidation: Observable<Bool>
        let getCodeButtonTap: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        let phoneValidation = input.phoneNumberText
            .orEmpty
            .map { $0.isValidString(.phoneNumber)}
            .share()
        
        return Output(phoneNumberValidation: phoneValidation, getCodeButtonTap: input.getCodeButtonTap)
    }
}
