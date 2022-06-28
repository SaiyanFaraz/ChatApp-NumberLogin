//
//  LoginViewController.swift
//  NumberLoginChatApp
//
//  Created by Shabuddin on 10/06/22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:  Properties
let logo: UIImageView = {
    let logo = UIImageView()
    logo.image = UIImage(named: "logoImage")
    logo.contentMode = .scaleAspectFill
    logo.layer.masksToBounds = true
    logo.layer.cornerRadius = 20
    return logo
}()

    let phoneNumber: UITextField = {
        let num = UITextField()
        let font = UIFont.systemFont(ofSize: 16)
        let atributedPlaceholder = NSAttributedString(string: "  Enter Phone Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font])
        num.attributedPlaceholder = atributedPlaceholder
        
        num.setBottomBorder(backgroundColor: UIColor.rgb(r: 218, g: 112, b: 214), borderColor: .black)
        num.textColor = .white
        
        return num
    }()
    
    let getOTP: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("GetOTP", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        return button
    }()
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureGradientLayer()
        configureUI()
    }
    
    //MARK: Selectors
    
    @objc func handleOTP() {
        let text = phoneNumber.text!
        let phoneNumber = "+91\(text)"
        AuthService.shared.startAuth(phoneNumber: phoneNumber) { [weak self] success in
            if success {
                print("Verification code sent")
                let verifyOTPVc = VerifyOTPViewController()
                self?.navigationController?.pushViewController(verifyOTPVc, animated: true)
            }
        }
    }
    // MARK: Helpers
    func configureUI() {
        view.addSubview(phoneNumber)
        phoneNumber.setAnchor( left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 20, paddingRight: 20, height: 50)
        phoneNumber.centerY(inview: view)
        
        view.addSubview(getOTP)
        getOTP.setAnchor(top: phoneNumber.bottomAnchor, paddingTop: 15, width: 150, height: 50)
        getOTP.centerX(inview: view)
        getOTP.addTarget(self, action: #selector(handleOTP), for: .touchUpInside)
    }
}

