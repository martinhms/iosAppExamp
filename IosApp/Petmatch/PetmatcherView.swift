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
                    )
                    DisclaimersBtnsView(
                        leftIconName: "xmark",
                        rightIconName: "heart.fill",
                        leftColor: .orange,
                        rightColor: .green,
                        buttonSize: 60,
                        onLeftTap: { onDecision(false) },
                        onRightTap: { onDecision(true) }
                    )
                }
                .padding(.horizontal)
            }
        }.navigationBarBackButtonHidden()
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

    private func onDecision(_ liked: Bool) {
        guard let pet = currentPet else { return }
        if currentPhotoIndex < pet.photos.count - 1 {
            withAnimation { currentPhotoIndex += 1 }
        } else {
            currentPhotoIndex = 0
            Task { await loadPet() }
        }
        print(liked ? "Me gusta" : "No me gusta")
    }
}

#Preview {
    PetmatcherView()
}

struct DisclaimersBtnsView: View {
    let leftIconName: String
    let rightIconName: String
    let leftColor: Color
    let rightColor: Color
    let buttonSize: CGFloat
    let onLeftTap: () -> Void
    let onRightTap: () -> Void

    init(
        leftIconName: String = "xmark",
        rightIconName: String = "heart.fill",
        leftColor: Color = .orange,
        rightColor: Color = .green,
        buttonSize: CGFloat = 80,
        onLeftTap: @escaping () -> Void = {},
        onRightTap: @escaping () -> Void = {}
    ) {
        self.leftIconName = leftIconName
        self.rightIconName = rightIconName
        self.leftColor = leftColor
        self.rightColor = rightColor
        self.buttonSize = buttonSize
        self.onLeftTap = onLeftTap
        self.onRightTap = onRightTap
    }

    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 60) {
                Button(action: { onLeftTap() }) {
                    Circle()
                        .fill(leftColor)
                        .frame(width: buttonSize, height: buttonSize)
                        .overlay(
                            Image(systemName: leftIconName)
                                .font(.system(size: buttonSize * 0.425, weight: .bold))
                                .foregroundColor(.white)
                        )
                }
                
                Button(action: { onRightTap() }) {
                    Circle()
                        .fill(rightColor)
                        .frame(width: buttonSize, height: buttonSize)
                        .overlay(
                            Image(systemName: rightIconName)
                                .font(.system(size: buttonSize * 0.425))
                                .foregroundColor(.white)
                        )
                }
            }
            .padding(.bottom, 24)
        }
    }
}
