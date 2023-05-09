//
//  CarFacadeManager.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 09/05/2023.
//

import Foundation
import SwiftUI

class CarFacadeManager {
    var engine = Engine()
    var headlights = Headlights()
    
    func startCar() {
        engine.start()
        headlights.turnOn()
    }
    
    func stopCar() {
        engine.stop()
        headlights.turnOff()
    }
}
