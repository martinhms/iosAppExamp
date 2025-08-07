//
//  PetmatcherView.swift
//  IosApp
//
//  Created by Martin Horacio Mendez on 07/08/2025.
//

import SwiftUI

struct PetmatcherView:  View {
    @State private var currentPet: Pet? = nil
    @State private var currentPhotoIndex: Int = 0
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color(.petmatchBackground)
                .ignoresSafeArea()
            
            if isLoading {
                ProgressView()
            } else if let pet = currentPet {
                ZStack {
                    PetCardView(
                        pet: pet,
                        currentPhotoUrl: pet.photos[currentPhotoIndex]
                    ) { liked in
                        // Si desliza a la derecha (liked), pasamos a la siguiente foto
                        if liked && currentPhotoIndex < pet.photos.count - 1 {
                            withAnimation {
                                currentPhotoIndex += 1
                            }
                        }
                        print(liked ? "Me gusta" : "No me gusta")
                    }
                }
                .padding(.horizontal)
            }
        }
        .task {
            await loadPet()
        }
    }
    
    
    private func loadPet() async {
        isLoading = true
        do {
            // Creamos un pet de prueba
            var pet = Pet.samplePet()
            // Cargamos fotos reales de la API
            let photos = try await PetApiService().fetchPhotos(count: 5)
            pet.photos = photos
            currentPet = pet
        } catch {
            print("Error loading pet photos: \(error)")
        }
        isLoading = false
    }
}

#Preview {
    PetmatcherView()
}
