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
    @State private var currentPhotoIndex: Int = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .fill(.white)
            VStack() {
                WebImage(url: URL(string: pet.photos[min(currentPhotoIndex, min(pet.photos.count - 1, 9))]))
                .resizable()
                .indicator(.activity)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .scaledToFit()
                .cornerRadius(32)
                .onTapGesture {
                    let maxPhotos = min(pet.photos.count, 10)
                    if currentPhotoIndex < maxPhotos - 1 {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            currentPhotoIndex += 1
                        }
                    } else {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            currentPhotoIndex = 0
                        }
                    }
                }
            
                PetPreviewDataView(pet: pet)
                Color.clear.frame(height: 70)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(32)
    }
}

struct PetPreviewDataView: View {
  let pet: Pet
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack {
        Text("\(pet.ownerName), \(pet.ownerAge)")
          .font(.system(size: 26, weight: .bold))
      }
      Text("\(pet.petName), \(pet.petAge)")
        .font(.system(size: 24, weight: .bold))
      Text("About")
        .font(.system(size: 20, weight: .bold))
      Text(pet.about)
        .font(.system(size: 16))
        .foregroundColor(.black.opacity(0.8))
        .lineSpacing(4)
      Text(pet.petName)
        .font(.system(size: 20, weight: .bold))
        .padding(.top, 4)
      VStack(alignment: .leading, spacing: 4) {
        Text("Breed: \(pet.breed)").font(.system(size: 16))
        Text("Likes: \(pet.likes)").font(.system(size: 16))
      }
      .foregroundColor(.black.opacity(0.8))
    }
    .padding(.horizontal, 16)
    .padding(.top, 10)
    .padding(.bottom, 16)
  }
}

#Preview {
    let pet = Pet.samplePet()
    return PetCardView(pet: pet)
}
