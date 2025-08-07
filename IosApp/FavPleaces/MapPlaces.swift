//
//  MapPlaces.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 05/08/2025.
//

import SwiftUI
import MapKit

struct MapPlaces: View {
    @State var position = MapCameraPosition.region(
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -34.663865, longitude: -58.540548), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map()
//                    .onTapGesture {
//                        <#code#>
//                    }
            }
        }
    }
}

#Preview {
    MapPlaces()
}
