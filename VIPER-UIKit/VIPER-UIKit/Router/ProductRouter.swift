//
//  ProductRouter.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation
import UIKit

struct ProductRouter: RouterProtocol {
    var presenter: PresenterProtocol?
    var entryPoint: EntryPoint?
//    var navigationController = UINavigationController()
    
    static func start() -> RouterProtocol {
        var router = ProductRouter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productsViewController = storyboard.instantiateViewController(identifier: "ProductsViewController") as! ProductsViewController
        
        var view: ViewProtocol = productsViewController
        var interactor: InteractorProtocol = ProductInteractor()
        var presenter: PresenterProtocol = ProductPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router 
        
        router.entryPoint = productsViewController
        
        return router
    }
    
    func goToProductDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productViewController = storyboard.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        entryPoint?.navigationController?.pushViewController(productViewController, animated: true)
    }
}
