//
//  MainViewController.swift
//  PetCoordinatorProject
//
//  Created by Stanislav Terentyev on 13.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var letsGoAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
       configureNavigationBar()
    }
    
    @IBAction func letsGoButtonTapped(_ sender: Any) {
        letsGoAction?()
    }
}

extension MainViewController {
    private func configureNavigationBar() {
        self.navigationItem.title = "Главная"
//        let backItem = UIBarButtonItem()
//            backItem.title = "Назад"
//            navigationItem.backBarButtonItem = backItem
    }
}
