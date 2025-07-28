//
//  ApiNetwork.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 27/07/2025.
//

import Foundation

// TODO agregar nota
class ApiNetwork{
    
    //CODABLE : protocolo para poder parsearlos
    struct Wrapper:Codable {
        let response:String
        let results: [Superhero]
    }
    
    struct Superhero: Codable, Identifiable{
        let id: String
        let name: String
    }
    
    func getHerosByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/c77f85c48ee99ecd8be3daa8e6503c1b/search/\(query)")!
        // TODO agregar nota
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
