//
//  MapLocationDetailsView.swift
//  MapKit-GettingStarted
//
//  Created by Glenn Ludszuweit on 10/05/2023.
//

import SwiftUI

struct MapLocationDetailsView: View {
    var placeName: String = ""
    
    var body: some View {
        Text(placeName)
    }
}

struct MapLocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MapLocationDetailsView()
    }
}
