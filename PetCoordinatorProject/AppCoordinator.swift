//
//  AppCoordinator.swift
//  PetCoordinatorProject
//
//  Created by Stanislav Terentyev on 13.05.2021.
//

import UIKit

class AppCoordinator: NSObject, Coordinator, UINavigationControllerDelegate, LetsGoProtocol {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = MainViewController.init(nibName: "MainViewController", bundle: nil)
        vc.letsGoAction = { [weak self] in
            self?.didLetsGoButtonTapped()
        }
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didLetsGoButtonTapped () {
        let child = LetsGoCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in
            childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //Navigating Back
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let profileViewController = fromViewController as? LetsGoViewController {
            childDidFinish(profileViewController.coordinator)
        }
    }
    
}
