//
//  HomeCoordinator.swift
//  UIKit-MVVMC
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        viewController.homeCoordinator = self
        navigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func gotToUsers () {
        navigationController.tabBarController!.selectedIndex = 1
    }
    
    func gotToLogin() {
        navigationController.tabBarController!.selectedIndex = 2
    }
}
