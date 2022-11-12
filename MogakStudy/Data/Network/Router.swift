//
//  Router.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/13.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case userLogin
    case userSignup(phoneNumber: String, FCMtoken: String, nick: String, birth: Date, email: String, gender: Int)
    case userWithdraw
    case userUpdateFCMToken
    
    /// 기본 URL
    var baseURL: URL {
        return URL(string: "http://api.sesac.co.kr:1207")!
    }
    /// 메서드
    /// - get, post, put, etc
    var method: HTTPMethod {
        switch self {
        case .userLogin: return .get
        case .userSignup: return .post
        case .userWithdraw: return .post
        case .userUpdateFCMToken: return .put
        }
    }
    /// URL 패스
    var path: String {
        switch self {
        case .userLogin: return "/v1/user"
        case .userSignup: return "/v1/user"
        case .userWithdraw: return "/v1/user/withdraw"
        case .userUpdateFCMToken: return "/v1/user/update_fcm_token"
        }
    }
    /// 헤더
    func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        if let idtoken = UserDefaults.standard.string(forKey: "idtoken") {
            headers["idtoken"] = idtoken
        }
        
        return headers
    }
    /// 파라미터
    var parameters: Parameters? {
        switch self {
        case .userSignup(let phoneNumber, let FCMtoken, let nick, let birth, let email, let gender):
            return [
                "phoneNumber": phoneNumber,
                "FCMtoken": FCMtoken,
                "nick": nick,
                "birth": birth,
                "email": email,
                "gender": gender
            ]
        default:
            return nil
        }
    }
    /// 인코딩
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers()
        
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
        
        return request
    }
}
// AF.request(Router.userLogin)
