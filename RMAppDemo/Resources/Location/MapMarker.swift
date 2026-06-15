//
//  MapMarker.swift
//  RMAppDemo
//
//  Created by BioOsc on 15/06/26.
//

import Foundation
import MapKit

struct MapLocationPin: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
