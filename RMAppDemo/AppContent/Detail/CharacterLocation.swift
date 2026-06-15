//
//  CharacterLocation.swift
//  RMAppDemo
//
//  Created by BioOsc on 15/06/26.
//

import SwiftUI
import MapKit

struct CharacterLocation: View {
    
    @State private var characterName: String
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.430240, longitude: -99.203255), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    init(character: String) {
        characterName = character
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [
            MapLocationPin(name: characterName, coordinate: CLLocationCoordinate2D(latitude: 19.430240, longitude: -99.203255))
        ]) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }
        .ignoresSafeArea(edges: .horizontal)
    }
}

#Preview {
    CharacterLocation(character: "Description")
}
