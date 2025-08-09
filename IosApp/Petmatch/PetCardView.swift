//
//  PetCardView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 07/08/2025.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI


struct PetCardView: View {
    let pet: Pet
    let currentPhotoUrl: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .fill(.white)
            VStack() {
                // Imagen
                WebImage(url: URL(string: currentPhotoUrl))
                .resizable()
                .indicator(.activity)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .cornerRadius(32)
                // Contenido de texto
                VStack(alignment: .leading, spacing: 5) {
                    // Nombres y edades
                    HStack {
                        Text("\(pet.ownerName), \(pet.ownerAge)")
                            .font(.system(size: 26, weight: .bold))
                    }
                    
                    Text("\(pet.petName), \(pet.petAge)")
                        .font(.system(size: 24, weight: .bold))
                    
                    // About
                    Text("About")
                        .font(.system(size: 20, weight: .bold))
                    
                    Text(pet.about)
                        .font(.system(size: 16))
                        .foregroundColor(.black.opacity(0.8))
                        .lineSpacing(4)
                    
                    // Información de la mascota
                    Text(pet.petName)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Breed: \(pet.breed)")
                            .font(.system(size: 16))
                        Text("Likes: \(pet.likes)")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.black.opacity(0.8))
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .padding(.bottom, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(32)
    }
}
#Preview {
    let sampleUrl = "https://images.dog.ceo/breeds/husky/n02110185_12619.jpg"
    let pet = Pet.samplePet()
    let currentUrl = pet.photos.first ?? sampleUrl
    return PetCardView(pet: pet, currentPhotoUrl: currentUrl)
}
