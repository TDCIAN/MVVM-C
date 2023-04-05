//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by JeongminKim on 2023/04/05.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(
            title: "로그인",
            style: .plain,
            target: self,
            action: #selector(didTapLoginButton)
        )
        navigationItem.rightBarButtonItem = item
        title = "로그인뷰"
    }
    
    deinit {
        print("LoginViewController - \(type(of: self)) deinit")
    }
    
    @objc func didTapLoginButton() {
        print("LoginViewController - didTapLoginButton()")
        delegate?.login()
    }
}
