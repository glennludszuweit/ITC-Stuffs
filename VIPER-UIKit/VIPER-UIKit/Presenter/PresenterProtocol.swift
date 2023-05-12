//
//  PresenterProtocol.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation

protocol PresenterProtocol {
    var view: ViewProtocol? { get set }
    var router: RouterProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    func getProductData(productData: ProductData)
    func goToProductDetails()
}
