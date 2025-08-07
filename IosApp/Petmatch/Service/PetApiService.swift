//
//  PetApiService.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 07/08/2025.
//

import Foundation

class PetApiService {
    func fetchPets() async throws -> [Pet] {
        let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=10")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Pet].self, from: data)
    }
    
    func fetchPhotos(count: Int = 5) async throws -> [String] {
        let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=\(count)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let photos = try JSONDecoder().decode([DogPhoto].self, from: data)
        return photos.map { $0.url }
    }
}

struct DogPhoto: Codable {
    let id: String
    let url: String
}
