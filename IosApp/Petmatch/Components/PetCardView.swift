import SwiftUI

struct PetCardView: View {
    let pet: Pet
    let currentPhotoUrl: String
    @State private var offset = CGSize.zero
    var onSwipe: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 5)
            
            VStack(spacing: 0) {
                // Imagen
                AsyncImage(url: URL(string: currentPhotoUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 400)
                .clipped()
                
                // Contenido de texto
                VStack(alignment: .leading, spacing: 12) {
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
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
        }
        .frame(width: 340, height: 680)
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    withAnimation {
                        handleSwipe(width: offset.width)
                    }
                }
        )
    }
    
    private func handleSwipe(width: CGFloat) {
        switch width {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            onSwipe?(false)
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            onSwipe?(true)
        default:
            offset = .zero
        }
    }
} 