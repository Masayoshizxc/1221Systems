//
//  MainCoordinator.swift
//  1221Systems
//
//  Created by Adilet on 23/8/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var finishDelegate: CoordinatorFinishDelegate?
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func details() {
        let vc = DetailedView()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
