//
//  MainCoordinator.swift
//  UIKit-MVVMC
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        tabBarViewController.mainCoordinator = self
        navigationController.pushViewController(tabBarViewController, animated: true)
    }
}
