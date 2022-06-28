//
//  ViewController.swift
//  NumberLoginChatApp
//
//  Created by Shabuddin on 10/06/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("logOut", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
        return button
    }()
    
    
    @objc func handelLogout() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch {
            print("DEBUG : Error Signing out")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(logoutButton)
        logoutButton.setAnchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 30, paddingRight: 30, height: 50)
        logoutButton.centerY(inview: view)
        logoutButton.addTarget(self, action: #selector(handelLogout), for: .touchUpInside)
        
    }
    
}
