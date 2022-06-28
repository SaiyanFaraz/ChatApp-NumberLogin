//
//  AuthService.swift
//  NumberLoginChatApp
//
//  Created by Shabuddin on 10/06/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
class AuthService {
    
    static let shared = AuthService()
    
    private var verificationId: String?
    
    func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self]verificationId, error in
            guard let verificationId = verificationId, error == nil else{ return }
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    func verifyCode(smsCode: String,  completion: @escaping (Bool) -> Void) {
        guard let verificationId = verificationId else {
            completion (false)
            return
        }

        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)
        Auth.auth().signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
}
