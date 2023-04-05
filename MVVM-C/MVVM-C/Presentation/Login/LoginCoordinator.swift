//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by JeongminKim on 2023/04/05.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator, LoginViewControllerDelegate {
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("LoginCoordinator - start()")
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .systemYellow
        viewController.delegate = self
        
//        self.navigationController.viewControllers = [viewController]
    }
    
    func login() {
        print("LoginCoordinator - login()")
        delegate?.didLoggedIn(self)
    }
    
    
}
