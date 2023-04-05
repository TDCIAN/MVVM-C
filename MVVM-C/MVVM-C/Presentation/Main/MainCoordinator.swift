//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by JeongminKim on 2023/04/05.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {
    var childCoordinators: [Coordinator] = []
    
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("MainCoordinator - start()")
        let viewController = MainViewController()
        viewController.view.backgroundColor = .systemRed
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
    
    func logout() {
        print("MainCoordinator - logout()")
        delegate?.didLoggedOut(self)
    }
    
    
}
