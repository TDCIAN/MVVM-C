//
//  ViewController.swift
//  MVVM-C
//
//  Created by JeongminKim on 2023/04/04.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {

    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(
            title: "로그아웃",
            style: .plain,
            target: self,
            action: #selector(didTapLogoutButton)
        )
        navigationItem.rightBarButtonItem = item
        title = "메인뷰"
    }
    
    deinit {
        print("MainViewController - \(type(of: self)) deinit")
    }

    @objc func didTapLogoutButton() {
        print("MainViewController - didTapLogoutButton()")
        delegate?.logout()
    }

}

