import Foundation

class PetApiService {
    func fetchPets() async throws -> [Pet] {
        let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=10")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Pet].self, from: data)
    }
} 