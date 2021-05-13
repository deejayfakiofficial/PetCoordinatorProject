//
//  LetsGoCoordinator.swift
//  PetCoordinatorProject
//
//  Created by Stanislav Terentyev on 13.05.2021.
//

import UIKit

class LetsGoCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LetsGoViewController.init(nibName: "LetsGoViewController", bundle: nil)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishProfile() {
//        parentCoordinator?.childDidFinish(self)
//    }
}
