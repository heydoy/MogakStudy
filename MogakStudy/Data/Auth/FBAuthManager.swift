//
//  FBAuthManager.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/11.
//

import Foundation
import FirebaseAuth

class FBAuthManager {
    private init () {}
    
    static let shared = FBAuthManager()
    
    /// Fireabase를 통해 인증코드를 SMS로 보내기
    func sendSMS(phoneNumber: String, completion: @escaping (Result<String, Error>) -> ()) {
        Auth.auth().languageCode = "ko" // 언어 설정
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            
            guard let error = error else {
                if let id = verificationID {
                    completion(.success(id))
                }
                return
            }
            completion(.failure(error))
            
            // Either received APNs or user has passed the reCAPTCHA
            // Step 5: Verification ID is saved for later use for verifying OTP with phone number
        }
    }
    
    /// Firebase 휴대전화 로그인
    func phoneVerification(verificationID: String, verificationCode: String, completion: @escaping (Result<AuthDataResult?, Error>) -> () ) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                let authError = error as NSError
                print(authError.description)
                completion(.failure(error))
                return
            }
            if let authResult = authResult {
                // User has signed in successfully and currentUser object is valid
                let currentUserInstance = Auth.auth().currentUser
                print(currentUserInstance)
                completion(.success(authResult))
            }
        }
    }
    
    /// Firebase ID token 받아오기
    
    func getIdToken(completion: @escaping (Result<String, Error>) -> ()) {
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                // Handle error
                completion(.failure(error))
                return
            }
            
            // Send token to your backend via HTTPS
            // ...
            
            if let idtoken = idToken {
                LoginManager.shared.idToken = idtoken
                print(idtoken)
                completion(.success(idtoken))
            }
            
        }
    }
}
