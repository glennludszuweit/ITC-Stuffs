//
//  MapView.swift
//  MapKit-GettingStarted
//
//  Created by Glenn Ludszuweit on 10/05/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @StateObject var mapViewModel = MapViewModel()
    
    @State var locations = [
        Location(name: "Exploratorium", coordinate: CLLocationCoordinate2D(latitude: 37.8017, longitude: -122.3973)),
        Location(name: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783))
    ]
    
    var currentRegion: Binding<MKCoordinateRegion>? {
        guard let cl = mapViewModel.currentLocation else {
            return staticRegion.getBinding()
        }
        
        DispatchQueue.main.async {
            locations.append(Location(name: "You", coordinate: cl.coordinate))
        }
        
        return MKCoordinateRegion(center: cl.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)).getBinding()
    }

    var body: some View {
        NavigationStack {
            Map(coordinateRegion: currentRegion!, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        MapLocationDetailsView(placeName: location.name)
                    } label: {
                        MapMarkerView(placeName: location.name)
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
