//
//  CarFacadeModel.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 09/05/2023.
//

import Foundation

struct Engine {
    var engineStarted: Bool = false
    
    mutating func start() {
        self.engineStarted = true
        print("Engine started.")
    }
    
    mutating func stop() {
        self.engineStarted = false
        print("Engine stopped.")
    }
}

struct Headlights {
    var lightsIsOn: Bool = false
    
    mutating func turnOn() {
        self.lightsIsOn = true
        print("Headlights turned on.")
    }
    
    mutating func turnOff() {
        self.lightsIsOn = false
        print("Headlights turned off.")
    }
}
