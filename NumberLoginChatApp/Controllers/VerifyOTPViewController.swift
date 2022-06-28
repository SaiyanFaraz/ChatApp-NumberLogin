//
//  VerifyOTPViewController.swift
//  NumberLoginChatApp
//
//  Created by Shabuddin on 10/06/22.
//

import UIKit

class VerifyOTPViewController: UIViewController {
    
    
    let smsTextField: UITextField = {
        let otp = UITextField()
        let font = UIFont.systemFont(ofSize: 16)
        
        let atributedPlaceholder = NSAttributedString(string: "  Enter OTP", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font])
        otp.attributedPlaceholder = atributedPlaceholder
        
        otp.setBottomBorder(backgroundColor: UIColor.rgb(r: 218, g: 112, b: 214), borderColor: .black)
        otp.textColor = .black
        
        return otp
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("VerifyOTP", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        return button
    }()
    
    //MARK: Selectors
    
    @objc func handleSignIn() {
        let verificationCode = smsTextField.text!
        AuthService.shared.verifyCode(smsCode: verificationCode) { success in
            guard success else {
                print("Verification code did not pass")
                return }
            DispatchQueue.main.async {
                let vc = HomeViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(smsTextField)
        smsTextField.setAnchor( left: view.leftAnchor, right: view.rightAnchor,  paddingLeft: 30, paddingRight: 30, height: 50 )
        smsTextField.centerY(inview: view)
        
        view.addSubview(loginButton)
        loginButton.setAnchor(top: smsTextField.bottomAnchor, paddingTop: 15, width: 200, height: 50)
        loginButton.centerX(inview: view)
        loginButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
    }
    
    
}
