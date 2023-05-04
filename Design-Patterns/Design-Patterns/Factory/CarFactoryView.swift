//
//  CarFactoryView.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 04/05/2023.
//

import SwiftUI

struct CarFactoryView: View {
    let carOptions = ["Tesla", "Ford"]
    @State private var carSelected = "Tesla"
    
    var body: some View {
        
        VStack {
            Picker("Select a paint color", selection: $carSelected) {
                ForEach(carOptions, id: \.self) { car in
                    Text(car)
                }
            }
            .pickerStyle(.inline)
            displayCar(car: carSelected)
        }
    }
    
    func displayCar(car: String) -> some View {
        var factory: CarFactory?
        
        if car == "Tesla" {
            factory = TeslaFactory()
            print(car)
        } else {
            factory = FordFactory()
            print(car)
        }
        
        return AsyncImage(url: factory!.createCar()) { Image in
            Image.resizable().scaledToFit().padding()
        } placeholder: {
            ProgressView()
        }
    }
}

struct CarFactoryView_Previews: PreviewProvider {
    static var previews: some View {
        CarFactoryView()
    }
}
