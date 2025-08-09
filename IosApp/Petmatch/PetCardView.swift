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
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 5)
            
            VStack(spacing: 0) {
                // Imagen
                WebImage(url: URL(string: currentPhotoUrl)) { image in
                    image
                 
                } placeholder: {
                    ProgressView()
                }
                .resizable()
                .scaledToFill()
                .frame(height: 400)
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
        //.frame(height: 680)
    }
}

// Helper para redondear solo las esquinas deseadas
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
