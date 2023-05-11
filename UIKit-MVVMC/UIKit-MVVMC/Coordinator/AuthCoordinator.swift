//
//  AuthCoordinator.swift
//  UIKit-MVVMC
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        loginViewController.authCoordinator = self
        navigationController.tabBarItem = UITabBarItem(title: "Login", image: UIImage(systemName: "person.fill"), tag: 3)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToRegister() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func goToResetPass() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let resetPassViewController = storyboard.instantiateViewController(withIdentifier: "ResetPassViewController") as! ResetPassViewController
        navigationController.pushViewController(resetPassViewController, animated: true)
    }
}
