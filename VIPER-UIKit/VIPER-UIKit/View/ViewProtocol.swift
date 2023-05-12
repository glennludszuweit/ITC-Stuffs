//
//  ViewProtocol.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 12/05/2023.
//

import Foundation

protocol ViewProtocol {
    var presenter: PresenterProtocol? { get set }
    func getProductsList(productsList: [Product])
}
