//
//  MapExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 01/08/2025.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -34.663865, longitude: -58.540548), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                
          
                Map(position: $position){
                    Marker("Titulo del marker", coordinate: CLLocationCoordinate2D(latitude: -44.663865, longitude: -48.540548))
                    Annotation("Marker personalizado", coordinate: CLLocationCoordinate2D(latitude: -45.663865, longitude: -48.540548)){
                        Circle().frame(height: 30)
                    }
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true)) //tipo satelite
//                .onMapCameraChange { context in
//                    print("Estamos en: \(context.region)") // imprime lat y long de donde esta posicionado
//                }  
                .onMapCameraChange(frequency: .continuous) { context in
                    print("Estamos en: \(context.region)") // imprime lat y long de donde esta posicionado
                }
                .onTapGesture { coor in
                    if let coordinates = proxy.convert(coor, from: .local){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                                ))
                        }
                    }
                }
            // .mapStyle(.imagery) //tipo sin nada
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir al norte"){
                        
                        withAnimation{
                             position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: -44.663865, longitude: -48.540548), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                                ))
                        }
                    }.padding(20).background(.white)
               
                    Button("Ir al suer"){
                        withAnimation{
                          position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: -34.663865, longitude: -58.540548), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                                ))
                        }
               
                    }.padding(20).background(.white)
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
