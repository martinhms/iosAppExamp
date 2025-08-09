//
//  PetCardView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 07/08/2025.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    let currentPhotoUrl: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 5)
            
            VStack(spacing: 0) {
                // Imagen
                AsyncImage(url: URL(string: currentPhotoUrl)) { image in
                    image
                        .resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 450)
                .clipped()
                
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
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
            }
        }
        .frame(width: 340, height: 680)
    }
}
