//
//  UserCoordinator.swift
//  UIKit-MVVMC
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

class UserCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "User", bundle: nil)
        let usersViewController = storyboard.instantiateViewController(identifier: "UsersViewController") as! UsersViewController
        usersViewController.userCoordinator = self
        navigationController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "externaldrive.fill"), tag: 2)
        navigationController.pushViewController(usersViewController, animated: true)
    }
    
    func goToDetails(user: User) {
        let storyboard = UIStoryboard(name: "User", bundle: nil)
        let userViewController = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        userViewController.user = user
        navigationController.pushViewController(userViewController, animated: true)
    }
}
