//
//  MenuView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 18/07/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: IMCView()){
                    Text("IMC calculator")
                }
                NavigationLink(destination:ImageExample()){
                    Text("ImageExample")
                }
                NavigationLink(destination: ListExample()){
                    Text("List Examples")
                } 
                NavigationLink(destination: SuperheroSearcher()){
                    Text("Superhero Searcher")
                }  
                NavigationLink(destination: MapPlaces()){
                    Text("Fav Places")
                }
                NavigationLink(destination: PetmatcherView()){
                    Text("Pet Matcher")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
