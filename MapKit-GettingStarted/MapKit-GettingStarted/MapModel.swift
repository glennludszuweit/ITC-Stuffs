//
//  MapModel.swift
//  MapKit-GettingStarted
//
//  Created by Glenn Ludszuweit on 10/05/2023.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
