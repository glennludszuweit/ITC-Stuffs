//
//  MapMarkerView.swift
//  MapKit-GettingStarted
//
//  Created by Glenn Ludszuweit on 10/05/2023.
//

import SwiftUI

struct MapMarkerView: View {
    var placeName: String = ""
    
    var body: some View {
        VStack {
            Text(placeName)
                .padding(6.5)
                .foregroundColor(.white)
                .background(.black.opacity(0.7))
                .cornerRadius(10)
            Group {
                Circle()
                    .frame(width: 20, height: 20)
                Image(systemName: "arrowtriangle.down.fill")
                    .frame(width: 40, height: 40)
                    .offset(x: 0, y: -25)
            }
                .tint(.blue)
        }
    }
}

struct MapMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        Circle()
            .stroke(.red, lineWidth: 3)
            .frame(width: 44, height: 44)
    }
}
