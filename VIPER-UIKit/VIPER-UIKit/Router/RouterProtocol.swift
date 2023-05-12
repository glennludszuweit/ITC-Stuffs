//
//  Router.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController & ViewProtocol

protocol RouterProtocol {
    var presenter: PresenterProtocol? { get set }
    var entryPoint: EntryPoint? { get set }
    static func start() -> RouterProtocol
    func goToProductDetails()
}
