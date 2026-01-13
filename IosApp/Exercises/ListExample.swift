//
//  ListExample.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 21/07/2025.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachi"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Dido")
]
var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Greymon"),
    Digimon(name: "Martinmon"),
    Digimon(name: "Angelmon")
]

struct ListExample: View {
    var body: some View {
//        List{
//            //se debe pasar el id con un valor que se sabe que no se va a repetir.
//            ForEach(pokemons, id:\.name){pokemon in
//                Text(pokemon.name)
//            }
//        }
        
//        List(digimons){digimon in
//            Text(digimon.name)
//        }
        
        List{
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id:\.name){pokemon in
                           Text(pokemon.name)
                       }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons){digimons in
                           Text(digimons.name)
                       }
            }
        }.listStyle(.grouped)
    }
}

struct Pokemon{
    let name: String
}

//Identifable optimiza los ids por atras para dibujalos. Se usa cuando no tenemos un valor unico en el objeto
struct Digimon : Identifiable{
    var id = UUID()
    let name: String
}
#Preview {
    ListExample()
}
