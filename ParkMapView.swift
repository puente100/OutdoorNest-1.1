//
//  ParkMapView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/15/24.
//

import SwiftUI
import MapKit

struct ParkMapView: View {
    
    let center = CLLocationCoordinate2D(latitude: 56.85317675, longitude: -157.5544362)
    var body: some View {
        Map() {
           Marker("Aniakchak National Monument & Preserve", coordinate: center)
        }
    }
}

#Preview {
    ParkMapView()
}
