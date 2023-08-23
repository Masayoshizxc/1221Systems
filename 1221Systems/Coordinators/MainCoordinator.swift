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
    
    func details(image: UIImage?, status: String, spesies: String, type: String, gender: String, originName: String, originType: String) {
        let vc = DetailedView()
        vc.coordinator = self
        vc.image.image = image
        vc.status.text = status
        vc.species.text = spesies
        vc.type.text = type
        vc.gender.text = gender
        vc.originName.text = originName
        vc.originType.text = originType
        navigationController.pushViewController(vc, animated: true)
    }
    
}
