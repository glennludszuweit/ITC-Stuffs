//
//  CarFacadeView.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 09/05/2023.
//

import SwiftUI

struct CarFacadeView: View {
    @State var engineState: String = ""
    let carFacadeManager = CarFacadeManager()
    
    var body: some View {
        VStack {
            Text(engineState)
            HStack {
                Group {
                    Button(action: {
                        engineState = "Engine Running"
                        carFacadeManager.startCar()
                    }) {
                        Text("Start Car")
                    }.tint(.green)
                    
                    Button(action: {
                        engineState = "Engine is Off"
                        carFacadeManager.stopCar()
                    }) {
                        Text("Stop Car")
                    }.tint(.red)
                }.padding()
                    .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct CarFacadeView_Previews: PreviewProvider {
    static var previews: some View {
        CarFacadeView()
    }
}
