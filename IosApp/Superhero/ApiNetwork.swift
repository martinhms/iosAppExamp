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
        let image:ImageSuperhero
    }
    
    struct SuperheroDetail: Codable{
        let id: String
        let name: String
        let image:ImageSuperhero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography:Codable{
        let fullName: String
        let alignment: String
        let publisher: String
        let aliases: [String]
        
        enum CodingKeys:String, CodingKey{ //Para parsear los campos que estan definidos con -
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    struct ImageSuperhero: Codable{
        let url:String
    }
    
    func getHerosByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/c77f85c48ee99ecd8be3daa8e6503c1b/search/\(query)")!
        // TODO agregar nota
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    
    func getHeroById(id:String)async throws -> SuperheroDetail {
        let url = URL(string: "https://superheroapi.com/api/c77f85c48ee99ecd8be3daa8e6503c1b/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(SuperheroDetail.self, from: data)
    }
}
