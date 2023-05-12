//
//  ProductPresenter.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 12/05/2023.
//

import Foundation

class ProductPresenter: PresenterProtocol {
    var view: ViewProtocol?
    var router: RouterProtocol?
    var interactor: InteractorProtocol? {
        didSet {
            Task {
                await interactor?.getProductData(urlString: "https://dummyjson.com/products")
            }
        }
    }
    
    func getProductData(productData: ProductData) {
        view?.getProductsList(productsList: productData.products)
    }
    
    func goToProductDetails() {
        router?.goToProductDetails()
    }
}
