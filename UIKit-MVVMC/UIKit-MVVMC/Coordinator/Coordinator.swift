//
//  Coordinator.swift
//  UIKit-MVVMC
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get set }
    func startCoordinator()
}
