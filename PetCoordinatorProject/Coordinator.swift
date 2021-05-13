//
//  Coordinator.swift
//  PetCoordinatorProject
//
//  Created by Stanislav Terentyev on 13.05.2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
