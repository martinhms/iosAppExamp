import SwiftUI

struct PetDetailsView: View {
    let pet: Pet

    var body: some View {
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

#Preview {
    let pet = Pet.samplePet()
    PetDetailsView(pet: pet)
}




