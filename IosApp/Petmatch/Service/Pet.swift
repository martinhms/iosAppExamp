//
//  Pet.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 07/08/2025.
//

import Foundation


struct Pet: Identifiable, Decodable {
    let id: String = UUID().uuidString
    var photos: [String] // Array de URLs de fotos
    // Datos del dueño
    var ownerName: String = "Laura"
    var ownerAge: Int = 28
    // Datos de la mascota
    var petName: String = "Bella"
    var petAge: Int = 4
    var breed: String = "Golden Retriever Mix"
    var likes: String = "Playing fetch, belly rubs"
    var about: String = "Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents.Dog lover, enjoy long walks and going on outdoor adventures! Looking to connect with other pet parents."
    
    // Para inicializar con fotos de prueba
    static func samplePet() -> Pet {
        return Pet(photos: [
            "https://api.thedogapi.com/v1/images/search?size=med",
            "https://api.thedogapi.com/v1/images/search?size=med",
            "https://api.thedogapi.com/v1/images/search?size=med"
        ])
    }
}

