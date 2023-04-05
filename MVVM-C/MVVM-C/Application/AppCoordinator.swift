//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by JeongminKim on 2023/04/05.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("AppCoordinator - start(isLoggedIn: \(isLoggedIn))")
        if isLoggedIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    
    private func showMainViewController() {
        print("AppCoordinator - showMainViewController()")
        let coordinator = MainCoordinator(
            navigationController: self.navigationController
        )
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func showLoginViewController() {
        print("AppCoordinator - showLoginViewController()")
        let coordinator = LoginCoordinator(
            navigationController: self.navigationController
        )
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        print("AppCoordinator - didLoggedIn(coordinator: \(coordinator))")
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainViewController()
    }
    
    func didLoggedOut(_ coordinator: MainCoordinator) {
        print("AppCoordinator - didLoggedOut(coordinator: \(coordinator))")
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showLoginViewController()
    }
}
