//
//  InteractorProtocol.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation

protocol InteractorProtocol {
    var presenter: PresenterProtocol? { get set }
    func getProductData(urlString: String) async
}
