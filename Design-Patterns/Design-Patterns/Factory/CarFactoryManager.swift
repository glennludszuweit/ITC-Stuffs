//
//  CarFactoryManager.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 04/05/2023.
//

import Foundation

protocol CarFactory {
    func createCar() -> URL
}

class FordFactory: CarFactory {
    func createCar() -> URL {
        return Ford().displayCar()
    }
}

class TeslaFactory: CarFactory {
    func createCar() -> URL {
        return Tesla().displayCar()
    }
}

class Car {
    func displayCar(imageURL: String) -> URL {
        return URL(string: imageURL)!
    }
}

class Ford: Car {
    override func displayCar(imageURL: String = "https://www.topgear.com/sites/default/files/images/cars-road-test/2021/05/fbd5ee7a4e5bf864de9cdae919555264/topgear_-_shelby_gt500-_002.jpg") -> URL {
        return URL(string: imageURL)!
    }
}

class Tesla: Car {
    override func displayCar(imageURL: String = "https://i.guim.co.uk/img/media/f145c8d73b66147fb11dbe1e52f10be78c4360df/0_249_3321_1993/master/3321.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=9a52a2cad25188952b4dff06304f8542") -> URL {
        return URL(string: imageURL)!
    }
}
